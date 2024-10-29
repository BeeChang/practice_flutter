

import 'package:decimal/decimal.dart';
import 'package:practice_flutter/model/state_test.dart';

class FakeStateRepository {

  Future<List<ProductSampleItem>> getFakeProducts() async {
    await Future.delayed(const Duration(milliseconds: 800));

    return [
      ProductSampleItem(
        pid: 'ITEM_001',
        name: '맥북 프로 16인치',
        price: Decimal.parse('2999.99'),
        count: 1,
      ),
      ProductSampleItem(
        pid: 'ITEM_002',
        name: '아이패드 프로 12.9',
        price: Decimal.parse('1299.99'),
        count: 2,
      ),
      ProductSampleItem(
        pid: 'ITEM_003',
        name: '애플워치',
        price: Decimal.parse('799.99'),
        count: 3,
      ),
      ProductSampleItem(
        pid: 'ITEM_004',
        name: '에어팟 프로 2',
        price: Decimal.parse('249.99'),
        count: 2,
      ),
      ProductSampleItem(
        pid: 'ITEM_005',
        name: '매직 키보드',
        price: Decimal.parse('199.99'),
        count: 4,
      ),
    ];
  }

  Future<UserDiscountCoupon> getFakeUserCoupon() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const UserDiscountCoupon(
      couponId: 'COUPON_15OFF',
      discountPercent: 15,
    );
  }
}