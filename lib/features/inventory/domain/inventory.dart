import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory.freezed.dart';
part 'inventory.g.dart';

enum InventoryStatus { draft, queued, submitted }

enum InventoryIssue implements Exception {
  invalidQuantity,
  incomplete,
  locked,
  notFound,
  emptyTitle,
  missingCatalog,
  accessDenied,
  staleCatalog,
  submissionChanged,
  network,
}

@freezed
abstract class Branch with _$Branch {
  const factory Branch({required String id, required String name}) = _Branch;
  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String branchId,
    required String name,
    required String sku,
    required String barcode,
    required String category,
    required int expected,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
abstract class CountLine with _$CountLine {
  const CountLine._();
  const factory CountLine({
    required String productId,
    required String name,
    required String sku,
    required String barcode,
    required int expected,
    int? counted,
  }) = _CountLine;

  factory CountLine.fromJson(Map<String, dynamic> json) => _$CountLineFromJson(json);

  int? get difference => counted == null ? null : counted! - expected;
}

@freezed
abstract class Inventory with _$Inventory {
  const Inventory._();
  const factory Inventory({
    required String id,
    required String branchId,
    required String branchName,
    required String title,
    required DateTime createdAt,
    required List<CountLine> lines,
    @Default(InventoryStatus.draft) InventoryStatus status,
    String? syncError,
  }) = _Inventory;

  factory Inventory.fromJson(Map<String, dynamic> json) => _$InventoryFromJson(json);

  int get countedLines => lines.where((line) => line.counted != null).length;
  int get varianceLines => lines.where((line) => (line.difference ?? 0) != 0).length;
  int get difference => lines.fold(0, (sum, line) => sum + (line.difference ?? 0));
  bool get isComplete => lines.isNotEmpty && countedLines == lines.length;

  Inventory count(String productId, int quantity) {
    if (status != InventoryStatus.draft) throw InventoryIssue.locked;
    if (quantity < 0 || quantity > 1000000) throw InventoryIssue.invalidQuantity;
    if (!lines.any((line) => line.productId == productId)) throw InventoryIssue.notFound;
    return copyWith(
      lines: [
        for (final line in lines)
          if (line.productId == productId) line.copyWith(counted: quantity) else line,
      ],
    );
  }

  Inventory fillRemainingWithZero() {
    if (status != InventoryStatus.draft) throw InventoryIssue.locked;
    return copyWith(lines: [for (final line in lines) line.copyWith(counted: line.counted ?? 0)]);
  }

  Inventory queue() {
    if (status != InventoryStatus.draft) throw InventoryIssue.locked;
    if (!isComplete) throw InventoryIssue.incomplete;
    return copyWith(status: InventoryStatus.queued, syncError: null);
  }
}
