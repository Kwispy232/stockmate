// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Branch _$BranchFromJson(Map<String, dynamic> json) =>
    _Branch(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$BranchToJson(_Branch instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  name: json['name'] as String,
  sku: json['sku'] as String,
  barcode: json['barcode'] as String,
  category: json['category'] as String,
  expected: (json['expected'] as num).toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'branchId': instance.branchId,
  'name': instance.name,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'category': instance.category,
  'expected': instance.expected,
};

_CountLine _$CountLineFromJson(Map<String, dynamic> json) => _CountLine(
  productId: json['productId'] as String,
  name: json['name'] as String,
  sku: json['sku'] as String,
  barcode: json['barcode'] as String,
  expected: (json['expected'] as num).toInt(),
  counted: (json['counted'] as num?)?.toInt(),
);

Map<String, dynamic> _$CountLineToJson(_CountLine instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'name': instance.name,
      'sku': instance.sku,
      'barcode': instance.barcode,
      'expected': instance.expected,
      'counted': instance.counted,
    };

_Inventory _$InventoryFromJson(Map<String, dynamic> json) => _Inventory(
  id: json['id'] as String,
  branchId: json['branchId'] as String,
  branchName: json['branchName'] as String,
  title: json['title'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lines: (json['lines'] as List<dynamic>)
      .map((e) => CountLine.fromJson(e as Map<String, dynamic>))
      .toList(),
  status:
      $enumDecodeNullable(_$InventoryStatusEnumMap, json['status']) ??
      InventoryStatus.draft,
  syncError: json['syncError'] as String?,
);

Map<String, dynamic> _$InventoryToJson(_Inventory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchId': instance.branchId,
      'branchName': instance.branchName,
      'title': instance.title,
      'createdAt': instance.createdAt.toIso8601String(),
      'lines': instance.lines.map((e) => e.toJson()).toList(),
      'status': _$InventoryStatusEnumMap[instance.status]!,
      'syncError': instance.syncError,
    };

const _$InventoryStatusEnumMap = {
  InventoryStatus.draft: 'draft',
  InventoryStatus.queued: 'queued',
  InventoryStatus.submitted: 'submitted',
};
