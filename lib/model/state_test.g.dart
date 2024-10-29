// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDiscountCouponImpl _$$UserDiscountCouponImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDiscountCouponImpl(
      couponId: json['couponId'] as String,
      discountPercent: (json['discountPercent'] as num).toInt(),
    );

Map<String, dynamic> _$$UserDiscountCouponImplToJson(
        _$UserDiscountCouponImpl instance) =>
    <String, dynamic>{
      'couponId': instance.couponId,
      'discountPercent': instance.discountPercent,
    };

_$ProductSampleItemImpl _$$ProductSampleItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductSampleItemImpl(
      pid: json['pid'] as String,
      name: json['name'] as String,
      price: Decimal.fromJson(json['price'] as String),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$ProductSampleItemImplToJson(
        _$ProductSampleItemImpl instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
    };
