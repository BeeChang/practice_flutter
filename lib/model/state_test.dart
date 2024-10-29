import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:decimal/decimal.dart';

part 'state_test.freezed.dart';
part 'state_test.g.dart';

@freezed
class UserDiscountCoupon with _$UserDiscountCoupon {
  const factory UserDiscountCoupon({
    required String couponId,
    required int discountPercent,
  }) = _UserDiscountCoupon;

  factory UserDiscountCoupon.fromJson(Map<String, dynamic> json) =>
      _$UserDiscountCouponFromJson(json);
}

@freezed
class ProductSampleItem with _$ProductSampleItem {
  const factory ProductSampleItem({
    required String pid,
    required String name,
    required Decimal price,
    required int count,
  }) = _ProductSampleItem;

  factory ProductSampleItem.fromJson(Map<String, dynamic> json) =>
      _$ProductSampleItemFromJson(json);
}
