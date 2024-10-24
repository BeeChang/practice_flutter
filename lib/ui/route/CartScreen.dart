import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final productId = args?['productId'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('장바구니')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('장바구니에 담긴 상품 ID: $productId'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/purchase',
                arguments: {'productId': productId},
              );
            },
            child: Text('구매하기'),
          ),
        ],
      ),
    );
  }
}