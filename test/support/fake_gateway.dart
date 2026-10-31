import 'dart:async';
import 'dart:io';

import 'package:stockmate/features/inventory/data/inventory_gateway.dart';
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
  int fetches = 0;
  Completer<void>? fetchBarrier;
  final submitted = <String, Inventory>{};
  final rejectedIds = <String>{};

  @override
  Future<Catalog> fetchCatalog() async {
    if (offline) throw const SocketException('offline');
    return catalog;
  }

  @override
  Future<void> submit(Inventory inventory) async {
    attempts++;
    if (rejectedIds.contains(inventory.id)) throw InventoryIssue.accessDenied;
    if (offline) throw const SocketException('offline');
    submitted.putIfAbsent(
      inventory.id,
      () => inventory.copyWith(status: InventoryStatus.submitted),
    );
    if (loseResponse) throw const SocketException('response lost');
  }

  @override
  Future<List<Inventory>> fetchSubmitted() async {
    fetches++;
    await fetchBarrier?.future;
    if (offline) throw const SocketException('offline');
    return submitted.values.toList();
  }
}
