import 'package:flutter/material.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final productId = args?['productId'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text('구매하기')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('구매할 상품 ID: $productId'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // 홈 화면으로 한번에 이동 (모든 스택 제거)
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                        (route) => false,
                  );
                },
                child: Text('홈으로 이동'),
              ),
              ElevatedButton(
                onPressed: () {
                  // 상품 상세 화면으로 이동 (중간 스택 제거)
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/detail',
                        (route) => route.settings.name == '/',
                    arguments: {'productId': productId},
                  );
                },
                child: Text('상품 상세로 이동'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}