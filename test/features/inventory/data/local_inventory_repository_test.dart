import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stockmate/core/database/app_database.dart';
import 'package:stockmate/features/inventory/data/inventory_gateway.dart';
import 'package:stockmate/features/inventory/data/local_inventory_repository.dart';
import 'package:stockmate/features/inventory/domain/inventory.dart';

const branch = Branch(id: 'branch', name: 'Store');
const catalog = Catalog(
  [branch],
  [
    Product(
      id: 'a',
      branchId: 'branch',
      name: 'Coffee',
      sku: 'A',
      barcode: '123',
      category: 'Coffee',
      expected: 8,
    ),
    Product(
      id: 'b',
      branchId: 'branch',
      name: 'Tea',
      sku: 'B',
      barcode: '456',
      category: 'Tea',
      expected: 3,
    ),
  ],
);

class FakeGateway implements InventoryGateway {
  bool offline = false;
  bool loseResponse = false;
  int attempts = 0;
  final submitted = <String, Inventory>{};

  @override
  Future<Catalog> fetchCatalog() async {
    if (offline) throw const SocketException('offline');
    return catalog;
  }

  @override
  Future<void> submit(Inventory inventory) async {
    attempts++;
    if (offline) throw const SocketException('offline');
    submitted.putIfAbsent(
      inventory.id,
      () => inventory.copyWith(status: InventoryStatus.submitted),
    );
    if (loseResponse) throw const SocketException('response lost');
  }

  @override
  Future<List<Inventory>> fetchSubmitted() async {
    if (offline) throw const SocketException('offline');
    return submitted.values.toList();
  }
}

void main() {
  late Directory directory;
  late File file;
  late AppDatabase db;
  late FakeGateway gateway;
  late LocalInventoryRepository repository;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('stockmate_test_');
    file = File('${directory.path}/inventory.sqlite');
    db = AppDatabase.forTesting(NativeDatabase(file));
    gateway = FakeGateway();
    repository = LocalInventoryRepository(db, gateway);
  });

  tearDown(() async {
    await db.close();
    await directory.delete(recursive: true);
  });

  Future<Inventory> current() async => (await repository.watchAll().first).single;

  test('draft and cached catalog survive restarting while offline', () async {
    final inventory = await repository.create(branch, 'Morning');
    await repository.count(inventory.id, 'a', 0);
    await db.close();
    gateway.offline = true;
    db = AppDatabase.forTesting(NativeDatabase(file));
    repository = LocalInventoryRepository(db, gateway);
    expect((await current()).lines.first.counted, 0);
    expect(await repository.branches(), [branch]);
    expect((await repository.create(branch, 'Offline count')).lines.length, 2);
  });

  test('concurrent edits retain both item changes', () async {
    final inventory = await repository.create(branch, 'Morning');
    await Future.wait([
      repository.count(inventory.id, 'a', 7),
      repository.count(inventory.id, 'b', 5),
    ]);
    expect((await current()).lines.map((line) => line.counted), [7, 5]);
  });

  test('a failed local write retains the previous draft', () async {
    final inventory = await repository.create(branch, 'Morning');
    await db.customStatement('''
      create trigger reject_write before update on stored_inventories
      begin select raise(abort, 'simulated disk failure'); end;
    ''');
    await expectLater(repository.count(inventory.id, 'a', 4), throwsException);
    expect((await current()).lines.first.counted, isNull);
  });

  test('failed send persists an immutable outbox, and restart retries the same ID', () async {
    final inventory = await repository.create(branch, 'Morning');
    await repository.fillRemaining(inventory.id);
    gateway.loseResponse = true;
    await expectLater(repository.submit(inventory.id), throwsA(isA<SocketException>()));
    expect((await current()).status, InventoryStatus.queued);
    expect((await current()).syncError, 'network');
    await expectLater(repository.count(inventory.id, 'a', 9), throwsA(InventoryIssue.locked));
    await db.close();
    db = AppDatabase.forTesting(NativeDatabase(file));
    repository = LocalInventoryRepository(db, gateway);
    gateway.loseResponse = false;
    await repository.synchronize();
    expect((await current()).status, InventoryStatus.submitted);
    expect(gateway.submitted.keys, [inventory.id]);
    expect(gateway.attempts, 2);
    expect(await db.select(db.pendingSubmissions).get(), isEmpty);
  });

  test('offline submission is queued before the request is attempted', () async {
    final inventory = await repository.create(branch, 'Morning');
    await repository.fillRemaining(inventory.id);
    gateway.offline = true;
    await expectLater(repository.submit(inventory.id), throwsA(isA<SocketException>()));
    expect((await current()).status, InventoryStatus.queued);
    expect((await db.select(db.pendingSubmissions).get()).single.inventoryId, inventory.id);
    gateway.offline = false;
    await repository.synchronize();
    await repository.submit(inventory.id);
    expect(gateway.attempts, 2);
  });

  test('unknown branch, invalid title and premature submission do not write', () async {
    await expectLater(repository.create(branch, '  '), throwsA(InventoryIssue.emptyTitle));
    await expectLater(
      repository.create(const Branch(id: 'other', name: 'Other'), 'Count'),
      throwsA(InventoryIssue.missingCatalog),
    );
    final inventory = await repository.create(branch, 'Morning');
    await expectLater(repository.submit(inventory.id), throwsA(InventoryIssue.incomplete));
    expect(await db.select(db.pendingSubmissions).get(), isEmpty);
    await repository.delete(inventory.id);
    expect(await repository.watchAll().first, isEmpty);
  });
}
