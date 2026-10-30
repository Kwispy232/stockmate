import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/database/app_database.dart';
import '../domain/inventory.dart';
import '../domain/inventory_repository.dart';
import 'inventory_gateway.dart';

class LocalInventoryRepository implements InventoryRepository {
  LocalInventoryRepository(this.db, this.gateway);
  final AppDatabase db;
  final InventoryGateway gateway;
  Future<void>? _sync;

  Inventory _decode(StoredInventory row) => Inventory.fromJson(jsonDecode(row.payload));

  Future<Inventory> _get(String id) async {
    final row = await (db.select(
      db.storedInventories,
    )..where((row) => row.id.equals(id))).getSingleOrNull();
    if (row == null) throw InventoryIssue.notFound;
    return _decode(row);
  }

  Future<void> _save(Inventory inventory) => db
      .into(db.storedInventories)
      .insertOnConflictUpdate(
        StoredInventoriesCompanion.insert(
          id: inventory.id,
          payload: jsonEncode(inventory.toJson()),
          updatedAt: DateTime.now().toUtc(),
        ),
      );

  @override
  Stream<List<Inventory>> watchAll() =>
      (db.select(db.storedInventories)..orderBy([(row) => OrderingTerm.desc(row.updatedAt)]))
          .watch()
          .map((rows) => rows.map(_decode).toList());

  Future<Catalog> _catalog() async {
    final row = await db.select(db.cachedCatalogs).getSingleOrNull();
    if (row == null) {
      await refreshCatalog();
      return _catalog();
    }
    return Catalog.fromJson(jsonDecode(row.payload));
  }

  @override
  Future<void> refreshCatalog() async {
    final catalog = await gateway.fetchCatalog();
    if (catalog.branches.isEmpty || catalog.products.isEmpty) throw InventoryIssue.missingCatalog;
    await db
        .into(db.cachedCatalogs)
        .insertOnConflictUpdate(
          CachedCatalogsCompanion.insert(id: const Value(1), payload: jsonEncode(catalog.toJson())),
        );
  }

  @override
  Future<List<Branch>> branches() async => (await _catalog()).branches;

  @override
  Future<Inventory> create(Branch branch, String title) async {
    if (title.trim().isEmpty || title.trim().length > 80) throw InventoryIssue.emptyTitle;
    final catalog = await _catalog();
    final products = catalog.products.where((p) => p.branchId == branch.id);
    if (!catalog.branches.any((b) => b.id == branch.id) || products.isEmpty) {
      throw InventoryIssue.missingCatalog;
    }
    final inventory = Inventory(
      id: const Uuid().v4(),
      branchId: branch.id,
      branchName: branch.name,
      title: title.trim(),
      createdAt: DateTime.now().toUtc(),
      lines: [
        for (final product in products)
          CountLine(
            productId: product.id,
            name: product.name,
            sku: product.sku,
            barcode: product.barcode,
            expected: product.expected,
          ),
      ],
    );
    await _save(inventory);
    return inventory;
  }

  Future<void> _edit(String id, Inventory Function(Inventory) change) =>
      db.transaction(() async => _save(change(await _get(id))));

  @override
  Future<void> count(String inventoryId, String productId, int quantity) =>
      _edit(inventoryId, (inventory) => inventory.count(productId, quantity));

  @override
  Future<void> fillRemaining(String inventoryId) =>
      _edit(inventoryId, (inventory) => inventory.fillRemainingWithZero());

  @override
  Future<void> delete(String inventoryId) => db.transaction(() async {
    if ((await _get(inventoryId)).status != InventoryStatus.draft) throw InventoryIssue.locked;
    await (db.delete(db.storedInventories)..where((row) => row.id.equals(inventoryId))).go();
  });

  @override
  Future<void> submit(String inventoryId) async {
    await db.transaction(() async {
      final inventory = await _get(inventoryId);
      if (inventory.status == InventoryStatus.submitted) return;
      if (inventory.status == InventoryStatus.draft) await _save(inventory.queue());
      await db
          .into(db.pendingSubmissions)
          .insertOnConflictUpdate(PendingSubmissionsCompanion.insert(inventoryId: inventoryId));
    });
    await synchronize();
  }

  @override
  Future<void> synchronize() => _sync ??= _drain().whenComplete(() => _sync = null);

  Future<void> _drain() async {
    final pending = await db.select(db.pendingSubmissions).get();
    for (final item in pending) {
      final inventory = await _get(item.inventoryId);
      try {
        await gateway.submit(inventory).timeout(const Duration(seconds: 15));
        await db.transaction(() async {
          await _save(inventory.copyWith(status: InventoryStatus.submitted, syncError: null));
          await (db.delete(
            db.pendingSubmissions,
          )..where((row) => row.inventoryId.equals(inventory.id))).go();
        });
      } catch (error) {
        final issue = error is InventoryIssue ? error : InventoryIssue.network;
        await _save(inventory.copyWith(syncError: issue.name));
        rethrow;
      }
    }
    final remote = await gateway.fetchSubmitted().timeout(const Duration(seconds: 15));
    await db.transaction(() async {
      for (final inventory in remote) {
        final local = await (db.select(
          db.storedInventories,
        )..where((row) => row.id.equals(inventory.id))).getSingleOrNull();
        if (local == null) await _save(inventory);
      }
    });
  }
}
