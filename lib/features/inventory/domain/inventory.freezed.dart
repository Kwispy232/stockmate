// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Branch {

 String get id; String get name;
/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchCopyWith<Branch> get copyWith => _$BranchCopyWithImpl<Branch>(this as Branch, _$identity);

  /// Serializes this Branch to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Branch;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Branch&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Branch;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as Branch;
  return 'Branch(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $BranchCopyWith<$Res>  {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) _then) = _$BranchCopyWithImpl;
@useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class _$BranchCopyWithImpl<$Res>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._self, this._then);

  final Branch _self;
  final $Res Function(Branch) _then;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(Branch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Branch].
extension BranchPatterns on Branch {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Branch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Branch value)  $default,){
final _that = this;
switch (_that) {
case _Branch():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Branch value)?  $default,){
final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.id,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _Branch():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Branch() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Branch implements Branch {
  const _Branch({required this.id, required this.name});
  factory _Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

@override final  String id;
@override final  String name;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchCopyWith<_Branch> get copyWith => __$BranchCopyWithImpl<_Branch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Branch&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'Branch(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$BranchCopyWith(_Branch value, $Res Function(_Branch) _then) = __$BranchCopyWithImpl;
@override @useResult
$Res call({
 String id, String name
});




}
/// @nodoc
class __$BranchCopyWithImpl<$Res>
    implements _$BranchCopyWith<$Res> {
  __$BranchCopyWithImpl(this._self, this._then);

  final _Branch _self;
  final $Res Function(_Branch) _then;

/// Create a copy of Branch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_Branch(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Product {

 String get id; String get branchId; String get name; String get sku; String get barcode; String get category; int get expected;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Product;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.barcode, _this.barcode) || other.barcode == _this.barcode)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.expected, _this.expected) || other.expected == _this.expected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Product;
  return Object.hash(runtimeType,_this.id,_this.branchId,_this.name,_this.sku,_this.barcode,_this.category,_this.expected);
}

@override
String toString() {
  final _this = this as Product;
  return 'Product(id: ${_this.id}, branchId: ${_this.branchId}, name: ${_this.name}, sku: ${_this.sku}, barcode: ${_this.barcode}, category: ${_this.category}, expected: ${_this.expected})';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String name, String sku, String barcode, String category, int expected
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? name = null,Object? sku = null,Object? barcode = null,Object? category = null,Object? expected = null,}) {
  return _then(Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,expected: null == expected ? _self.expected : expected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String name,  String sku,  String barcode,  String category,  int expected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.branchId,_that.name,_that.sku,_that.barcode,_that.category,_that.expected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String name,  String sku,  String barcode,  String category,  int expected)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.branchId,_that.name,_that.sku,_that.barcode,_that.category,_that.expected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String name,  String sku,  String barcode,  String category,  int expected)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.branchId,_that.name,_that.sku,_that.barcode,_that.category,_that.expected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.id, required this.branchId, required this.name, required this.sku, required this.barcode, required this.category, required this.expected});
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  String id;
@override final  String branchId;
@override final  String name;
@override final  String sku;
@override final  String barcode;
@override final  String category;
@override final  int expected;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.category, category) || other.category == category)&&(identical(other.expected, expected) || other.expected == expected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,branchId,name,sku,barcode,category,expected);
}

@override
String toString() {
    return 'Product(id: $id, branchId: $branchId, name: $name, sku: $sku, barcode: $barcode, category: $category, expected: $expected)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String name, String sku, String barcode, String category, int expected
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? name = null,Object? sku = null,Object? barcode = null,Object? category = null,Object? expected = null,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,expected: null == expected ? _self.expected : expected // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CountLine {

 String get productId; String get name; String get sku; String get barcode; int get expected; int? get counted;
/// Create a copy of CountLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountLineCopyWith<CountLine> get copyWith => _$CountLineCopyWithImpl<CountLine>(this as CountLine, _$identity);

  /// Serializes this CountLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CountLine;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountLine&&(identical(other.productId, _this.productId) || other.productId == _this.productId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.sku, _this.sku) || other.sku == _this.sku)&&(identical(other.barcode, _this.barcode) || other.barcode == _this.barcode)&&(identical(other.expected, _this.expected) || other.expected == _this.expected)&&(identical(other.counted, _this.counted) || other.counted == _this.counted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CountLine;
  return Object.hash(runtimeType,_this.productId,_this.name,_this.sku,_this.barcode,_this.expected,_this.counted);
}

@override
String toString() {
  final _this = this as CountLine;
  return 'CountLine(productId: ${_this.productId}, name: ${_this.name}, sku: ${_this.sku}, barcode: ${_this.barcode}, expected: ${_this.expected}, counted: ${_this.counted})';
}


}

/// @nodoc
abstract mixin class $CountLineCopyWith<$Res>  {
  factory $CountLineCopyWith(CountLine value, $Res Function(CountLine) _then) = _$CountLineCopyWithImpl;
@useResult
$Res call({
 String productId, String name, String sku, String barcode, int expected, int? counted
});




}
/// @nodoc
class _$CountLineCopyWithImpl<$Res>
    implements $CountLineCopyWith<$Res> {
  _$CountLineCopyWithImpl(this._self, this._then);

  final CountLine _self;
  final $Res Function(CountLine) _then;

/// Create a copy of CountLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? name = null,Object? sku = null,Object? barcode = null,Object? expected = null,Object? counted = freezed,}) {
  return _then(CountLine(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,expected: null == expected ? _self.expected : expected // ignore: cast_nullable_to_non_nullable
as int,counted: freezed == counted ? _self.counted : counted // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CountLine].
extension CountLinePatterns on CountLine {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountLine() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountLine value)  $default,){
final _that = this;
switch (_that) {
case _CountLine():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountLine value)?  $default,){
final _that = this;
switch (_that) {
case _CountLine() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String name,  String sku,  String barcode,  int expected,  int? counted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountLine() when $default != null:
return $default(_that.productId,_that.name,_that.sku,_that.barcode,_that.expected,_that.counted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String name,  String sku,  String barcode,  int expected,  int? counted)  $default,) {final _that = this;
switch (_that) {
case _CountLine():
return $default(_that.productId,_that.name,_that.sku,_that.barcode,_that.expected,_that.counted);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String name,  String sku,  String barcode,  int expected,  int? counted)?  $default,) {final _that = this;
switch (_that) {
case _CountLine() when $default != null:
return $default(_that.productId,_that.name,_that.sku,_that.barcode,_that.expected,_that.counted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CountLine extends CountLine {
  const _CountLine({required this.productId, required this.name, required this.sku, required this.barcode, required this.expected, this.counted}): super._();
  factory _CountLine.fromJson(Map<String, dynamic> json) => _$CountLineFromJson(json);

@override final  String productId;
@override final  String name;
@override final  String sku;
@override final  String barcode;
@override final  int expected;
@override final  int? counted;

/// Create a copy of CountLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountLineCopyWith<_CountLine> get copyWith => __$CountLineCopyWithImpl<_CountLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountLineToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountLine&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.expected, expected) || other.expected == expected)&&(identical(other.counted, counted) || other.counted == counted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,productId,name,sku,barcode,expected,counted);
}

@override
String toString() {
    return 'CountLine(productId: $productId, name: $name, sku: $sku, barcode: $barcode, expected: $expected, counted: $counted)';
}


}

/// @nodoc
abstract mixin class _$CountLineCopyWith<$Res> implements $CountLineCopyWith<$Res> {
  factory _$CountLineCopyWith(_CountLine value, $Res Function(_CountLine) _then) = __$CountLineCopyWithImpl;
@override @useResult
$Res call({
 String productId, String name, String sku, String barcode, int expected, int? counted
});




}
/// @nodoc
class __$CountLineCopyWithImpl<$Res>
    implements _$CountLineCopyWith<$Res> {
  __$CountLineCopyWithImpl(this._self, this._then);

  final _CountLine _self;
  final $Res Function(_CountLine) _then;

/// Create a copy of CountLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? name = null,Object? sku = null,Object? barcode = null,Object? expected = null,Object? counted = freezed,}) {
  return _then(_CountLine(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: null == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String,expected: null == expected ? _self.expected : expected // ignore: cast_nullable_to_non_nullable
as int,counted: freezed == counted ? _self.counted : counted // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Inventory {

 String get id; String get branchId; String get branchName; String get title; DateTime get createdAt; List<CountLine> get lines; InventoryStatus get status; String? get syncError;
/// Create a copy of Inventory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryCopyWith<Inventory> get copyWith => _$InventoryCopyWithImpl<Inventory>(this as Inventory, _$identity);

  /// Serializes this Inventory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Inventory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Inventory&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.branchId, _this.branchId) || other.branchId == _this.branchId)&&(identical(other.branchName, _this.branchName) || other.branchName == _this.branchName)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.syncError, _this.syncError) || other.syncError == _this.syncError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Inventory;
  return Object.hash(runtimeType,_this.id,_this.branchId,_this.branchName,_this.title,_this.createdAt,const DeepCollectionEquality().hash(_this.lines),_this.status,_this.syncError);
}

@override
String toString() {
  final _this = this as Inventory;
  return 'Inventory(id: ${_this.id}, branchId: ${_this.branchId}, branchName: ${_this.branchName}, title: ${_this.title}, createdAt: ${_this.createdAt}, lines: ${_this.lines}, status: ${_this.status}, syncError: ${_this.syncError})';
}


}

/// @nodoc
abstract mixin class $InventoryCopyWith<$Res>  {
  factory $InventoryCopyWith(Inventory value, $Res Function(Inventory) _then) = _$InventoryCopyWithImpl;
@useResult
$Res call({
 String id, String branchId, String branchName, String title, DateTime createdAt, List<CountLine> lines, InventoryStatus status, String? syncError
});




}
/// @nodoc
class _$InventoryCopyWithImpl<$Res>
    implements $InventoryCopyWith<$Res> {
  _$InventoryCopyWithImpl(this._self, this._then);

  final Inventory _self;
  final $Res Function(Inventory) _then;

/// Create a copy of Inventory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? title = null,Object? createdAt = null,Object? lines = null,Object? status = null,Object? syncError = freezed,}) {
  return _then(Inventory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CountLine>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InventoryStatus,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Inventory].
extension InventoryPatterns on Inventory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Inventory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Inventory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Inventory value)  $default,){
final _that = this;
switch (_that) {
case _Inventory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Inventory value)?  $default,){
final _that = this;
switch (_that) {
case _Inventory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName,  String title,  DateTime createdAt,  List<CountLine> lines,  InventoryStatus status,  String? syncError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Inventory() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.title,_that.createdAt,_that.lines,_that.status,_that.syncError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String branchId,  String branchName,  String title,  DateTime createdAt,  List<CountLine> lines,  InventoryStatus status,  String? syncError)  $default,) {final _that = this;
switch (_that) {
case _Inventory():
return $default(_that.id,_that.branchId,_that.branchName,_that.title,_that.createdAt,_that.lines,_that.status,_that.syncError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String branchId,  String branchName,  String title,  DateTime createdAt,  List<CountLine> lines,  InventoryStatus status,  String? syncError)?  $default,) {final _that = this;
switch (_that) {
case _Inventory() when $default != null:
return $default(_that.id,_that.branchId,_that.branchName,_that.title,_that.createdAt,_that.lines,_that.status,_that.syncError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Inventory extends Inventory {
  const _Inventory({required this.id, required this.branchId, required this.branchName, required this.title, required this.createdAt, required  List<CountLine> lines, this.status = InventoryStatus.draft, this.syncError}): _lines = lines,super._();
  factory _Inventory.fromJson(Map<String, dynamic> json) => _$InventoryFromJson(json);

@override final  String id;
@override final  String branchId;
@override final  String branchName;
@override final  String title;
@override final  DateTime createdAt;
 final  List<CountLine> _lines;
@override List<CountLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override@JsonKey() final  InventoryStatus status;
@override final  String? syncError;

/// Create a copy of Inventory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryCopyWith<_Inventory> get copyWith => __$InventoryCopyWithImpl<_Inventory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InventoryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Inventory&&(identical(other.id, id) || other.id == id)&&(identical(other.branchId, branchId) || other.branchId == branchId)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.lines, _lines)&&(identical(other.status, status) || other.status == status)&&(identical(other.syncError, syncError) || other.syncError == syncError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,branchId,branchName,title,createdAt,const DeepCollectionEquality().hash(_lines),status,syncError);
}

@override
String toString() {
    return 'Inventory(id: $id, branchId: $branchId, branchName: $branchName, title: $title, createdAt: $createdAt, lines: $lines, status: $status, syncError: $syncError)';
}


}

/// @nodoc
abstract mixin class _$InventoryCopyWith<$Res> implements $InventoryCopyWith<$Res> {
  factory _$InventoryCopyWith(_Inventory value, $Res Function(_Inventory) _then) = __$InventoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String branchId, String branchName, String title, DateTime createdAt, List<CountLine> lines, InventoryStatus status, String? syncError
});




}
/// @nodoc
class __$InventoryCopyWithImpl<$Res>
    implements _$InventoryCopyWith<$Res> {
  __$InventoryCopyWithImpl(this._self, this._then);

  final _Inventory _self;
  final $Res Function(_Inventory) _then;

/// Create a copy of Inventory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? branchId = null,Object? branchName = null,Object? title = null,Object? createdAt = null,Object? lines = null,Object? status = null,Object? syncError = freezed,}) {
  return _then(_Inventory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,branchId: null == branchId ? _self.branchId : branchId // ignore: cast_nullable_to_non_nullable
as String,branchName: null == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CountLine>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InventoryStatus,syncError: freezed == syncError ? _self.syncError : syncError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
