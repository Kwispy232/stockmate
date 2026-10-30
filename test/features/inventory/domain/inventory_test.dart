import 'package:flutter_test/flutter_test.dart';
import 'package:stockmate/features/inventory/domain/inventory.dart';

void main() {
  Inventory draft() => Inventory(
    id: 'inventory',
    branchId: 'branch',
    branchName: 'Store',
    title: 'Morning count',
    createdAt: DateTime.utc(2026, 10, 30),
    lines: const [
      CountLine(productId: 'coffee', name: 'Coffee', sku: 'C', barcode: '123', expected: 8),
      CountLine(productId: 'tea', name: 'Tea', sku: 'T', barcode: '456', expected: 3),
    ],
  );

  test('uncounted differs from an explicit zero', () {
    final inventory = draft().count('coffee', 0);
    expect(inventory.countedLines, 1);
    expect(inventory.lines.first.difference, -8);
    expect(inventory.lines.last.difference, isNull);
    expect(inventory.queue, throwsA(InventoryIssue.incomplete));
  });

  test('counting preserves the stock snapshot and computes signed differences', () {
    final inventory = draft().count('coffee', 10).count('tea', 2);
    expect(inventory.difference, 1);
    expect(inventory.varianceLines, 2);
    expect(inventory.lines.first.expected, 8);
    expect(inventory.queue().status, InventoryStatus.queued);
    expect(draft().lines.first.counted, isNull);
  });

  test('invalid quantities and unknown products are rejected', () {
    for (final quantity in [-1, 1000001]) {
      expect(() => draft().count('coffee', quantity), throwsA(InventoryIssue.invalidQuantity));
    }
    expect(() => draft().count('unknown', 1), throwsA(InventoryIssue.notFound));
  });

  test('zero fill preserves counts, and queued/submitted inventories are immutable', () {
    final inventory = draft().count('coffee', 4).fillRemainingWithZero();
    expect(inventory.lines.map((line) => line.counted), [4, 0]);
    for (final status in [InventoryStatus.queued, InventoryStatus.submitted]) {
      final locked = inventory.copyWith(status: status);
      expect(() => locked.count('coffee', 5), throwsA(InventoryIssue.locked));
      expect(locked.fillRemainingWithZero, throwsA(InventoryIssue.locked));
      expect(locked.queue, throwsA(InventoryIssue.locked));
    }
  });

  test('empty inventories cannot be submitted', () {
    expect(draft().copyWith(lines: []).queue, throwsA(InventoryIssue.incomplete));
  });

  test('persisted queued snapshots retain identity, quantities and retry state', () {
    final inventory = draft().fillRemainingWithZero().queue().copyWith(syncError: 'network');
    expect(Inventory.fromJson(inventory.toJson()), inventory);
  });
}
