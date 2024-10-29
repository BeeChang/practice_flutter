import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/model/state_test.dart';
import 'package:practice_flutter/repository/fake_state_repository.dart';

class ProviderViewModel extends ChangeNotifier {
  final FakeStateRepository _repository;

  ProviderViewModel({required FakeStateRepository repository})
      : _repository = repository,
        _state = DiscountProductState.initial; // 초기값 사용

  DiscountProductState _state;
  DiscountProductState get state => _state;

  Future<void> loadInitialData() async {
    _setState(_state.copyWith(isLoading: true));

    try {
      final products = await _repository.getFakeProducts();
      final coupon = await _repository.getFakeUserCoupon();

      _setState(_state.copyWith(
        items: products,
        discountPercent: coupon.discountPercent,
        isLoading: false,
      ));

      _calculateTotalPrice();
    } catch (e) {
      print('Error loading data: $e');
      _setState(_state.copyWith(isLoading: false));
    }
  }

  void toggleDiscount(bool value) {
    _setState(_state.copyWith(isDiscountApplied: value));
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    Decimal total = _state.items.fold(
      Decimal.parse('0'),
          (sum, item) => sum + (item.price * Decimal.parse(item.count.toString())),
    );

    if (_state.isDiscountApplied) {
      final hundred = Decimal.parse('100');
      final discount = Decimal.parse(_state.discountPercent.toString());
      total = total.remainder(hundred - discount);
    }

    _setState(_state.copyWith(totalDiscountPrice: total));
  }

  void _setState(DiscountProductState newState) {
    _state = newState;
    notifyListeners();
  }
}

class DiscountProductState {
  final List<ProductSampleItem> items;
  final int discountPercent;
  final bool isDiscountApplied;
  final Decimal totalDiscountPrice;
  final bool isLoading;

  // 1. 생성자에서 required로 변경
  const DiscountProductState({
    required this.items,
    required this.discountPercent,
    required this.isDiscountApplied,
    required this.totalDiscountPrice,
    required this.isLoading,
  });

   static DiscountProductState get initial => DiscountProductState(
    items: const [],
    discountPercent: 0,
    isDiscountApplied: false,
    totalDiscountPrice: Decimal.parse('0'),
    isLoading: false,
  );

   DiscountProductState copyWith({
    List<ProductSampleItem>? items,
    int? discountPercent,
    bool? isDiscountApplied,
    Decimal? totalDiscountPrice,
    bool? isLoading,
  }) {
    return DiscountProductState(
      items: items ?? this.items,
      discountPercent: discountPercent ?? this.discountPercent,
      isDiscountApplied: isDiscountApplied ?? this.isDiscountApplied,
      totalDiscountPrice: totalDiscountPrice ?? this.totalDiscountPrice,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
