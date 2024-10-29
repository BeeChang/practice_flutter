// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDiscountCoupon _$UserDiscountCouponFromJson(Map<String, dynamic> json) {
  return _UserDiscountCoupon.fromJson(json);
}

/// @nodoc
mixin _$UserDiscountCoupon {
  String get couponId => throw _privateConstructorUsedError;
  int get discountPercent => throw _privateConstructorUsedError;

  /// Serializes this UserDiscountCoupon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserDiscountCoupon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserDiscountCouponCopyWith<UserDiscountCoupon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDiscountCouponCopyWith<$Res> {
  factory $UserDiscountCouponCopyWith(
          UserDiscountCoupon value, $Res Function(UserDiscountCoupon) then) =
      _$UserDiscountCouponCopyWithImpl<$Res, UserDiscountCoupon>;
  @useResult
  $Res call({String couponId, int discountPercent});
}

/// @nodoc
class _$UserDiscountCouponCopyWithImpl<$Res, $Val extends UserDiscountCoupon>
    implements $UserDiscountCouponCopyWith<$Res> {
  _$UserDiscountCouponCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserDiscountCoupon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponId = null,
    Object? discountPercent = null,
  }) {
    return _then(_value.copyWith(
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDiscountCouponImplCopyWith<$Res>
    implements $UserDiscountCouponCopyWith<$Res> {
  factory _$$UserDiscountCouponImplCopyWith(_$UserDiscountCouponImpl value,
          $Res Function(_$UserDiscountCouponImpl) then) =
      __$$UserDiscountCouponImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String couponId, int discountPercent});
}

/// @nodoc
class __$$UserDiscountCouponImplCopyWithImpl<$Res>
    extends _$UserDiscountCouponCopyWithImpl<$Res, _$UserDiscountCouponImpl>
    implements _$$UserDiscountCouponImplCopyWith<$Res> {
  __$$UserDiscountCouponImplCopyWithImpl(_$UserDiscountCouponImpl _value,
      $Res Function(_$UserDiscountCouponImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserDiscountCoupon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponId = null,
    Object? discountPercent = null,
  }) {
    return _then(_$UserDiscountCouponImpl(
      couponId: null == couponId
          ? _value.couponId
          : couponId // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDiscountCouponImpl implements _UserDiscountCoupon {
  const _$UserDiscountCouponImpl(
      {required this.couponId, required this.discountPercent});

  factory _$UserDiscountCouponImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDiscountCouponImplFromJson(json);

  @override
  final String couponId;
  @override
  final int discountPercent;

  @override
  String toString() {
    return 'UserDiscountCoupon(couponId: $couponId, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDiscountCouponImpl &&
            (identical(other.couponId, couponId) ||
                other.couponId == couponId) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, couponId, discountPercent);

  /// Create a copy of UserDiscountCoupon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDiscountCouponImplCopyWith<_$UserDiscountCouponImpl> get copyWith =>
      __$$UserDiscountCouponImplCopyWithImpl<_$UserDiscountCouponImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDiscountCouponImplToJson(
      this,
    );
  }
}

abstract class _UserDiscountCoupon implements UserDiscountCoupon {
  const factory _UserDiscountCoupon(
      {required final String couponId,
      required final int discountPercent}) = _$UserDiscountCouponImpl;

  factory _UserDiscountCoupon.fromJson(Map<String, dynamic> json) =
      _$UserDiscountCouponImpl.fromJson;

  @override
  String get couponId;
  @override
  int get discountPercent;

  /// Create a copy of UserDiscountCoupon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDiscountCouponImplCopyWith<_$UserDiscountCouponImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductSampleItem _$ProductSampleItemFromJson(Map<String, dynamic> json) {
  return _ProductSampleItem.fromJson(json);
}

/// @nodoc
mixin _$ProductSampleItem {
  String get pid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Decimal get price => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this ProductSampleItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductSampleItemCopyWith<ProductSampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSampleItemCopyWith<$Res> {
  factory $ProductSampleItemCopyWith(
          ProductSampleItem value, $Res Function(ProductSampleItem) then) =
      _$ProductSampleItemCopyWithImpl<$Res, ProductSampleItem>;
  @useResult
  $Res call({String pid, String name, Decimal price, int count});
}

/// @nodoc
class _$ProductSampleItemCopyWithImpl<$Res, $Val extends ProductSampleItem>
    implements $ProductSampleItemCopyWith<$Res> {
  _$ProductSampleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? name = null,
    Object? price = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Decimal,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductSampleItemImplCopyWith<$Res>
    implements $ProductSampleItemCopyWith<$Res> {
  factory _$$ProductSampleItemImplCopyWith(_$ProductSampleItemImpl value,
          $Res Function(_$ProductSampleItemImpl) then) =
      __$$ProductSampleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pid, String name, Decimal price, int count});
}

/// @nodoc
class __$$ProductSampleItemImplCopyWithImpl<$Res>
    extends _$ProductSampleItemCopyWithImpl<$Res, _$ProductSampleItemImpl>
    implements _$$ProductSampleItemImplCopyWith<$Res> {
  __$$ProductSampleItemImplCopyWithImpl(_$ProductSampleItemImpl _value,
      $Res Function(_$ProductSampleItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? name = null,
    Object? price = null,
    Object? count = null,
  }) {
    return _then(_$ProductSampleItemImpl(
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Decimal,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductSampleItemImpl implements _ProductSampleItem {
  const _$ProductSampleItemImpl(
      {required this.pid,
      required this.name,
      required this.price,
      required this.count});

  factory _$ProductSampleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductSampleItemImplFromJson(json);

  @override
  final String pid;
  @override
  final String name;
  @override
  final Decimal price;
  @override
  final int count;

  @override
  String toString() {
    return 'ProductSampleItem(pid: $pid, name: $name, price: $price, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSampleItemImpl &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pid, name, price, count);

  /// Create a copy of ProductSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSampleItemImplCopyWith<_$ProductSampleItemImpl> get copyWith =>
      __$$ProductSampleItemImplCopyWithImpl<_$ProductSampleItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductSampleItemImplToJson(
      this,
    );
  }
}

abstract class _ProductSampleItem implements ProductSampleItem {
  const factory _ProductSampleItem(
      {required final String pid,
      required final String name,
      required final Decimal price,
      required final int count}) = _$ProductSampleItemImpl;

  factory _ProductSampleItem.fromJson(Map<String, dynamic> json) =
      _$ProductSampleItemImpl.fromJson;

  @override
  String get pid;
  @override
  String get name;
  @override
  Decimal get price;
  @override
  int get count;

  /// Create a copy of ProductSampleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductSampleItemImplCopyWith<_$ProductSampleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
