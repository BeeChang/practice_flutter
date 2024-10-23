import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final productId = args?['productId'] ?? 0;
    Logger().e('DetailScreen 호출');


    return Scaffold(
      appBar: AppBar(
        title: Text('상품 상세'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // 홈으로 돌아가면서 데이터 전달
            Logger().e('DetailScreen pop 호출'); // 로그 추가
            // 홈으로 돌아가면서 데이터 전달
            Navigator.pop(context, {
              'lastViewedProduct': productId,
              'timestamp': DateTime.now().toString(),
            });
            Logger().e('DetailScreen pop 완료'); // 로그 추가
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('상품 ID: $productId'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/cart',
                arguments: {'productId': productId},
              );
            },
            child: Text('장바구니에 담기'),
          ),
        ],
      ),
    );
  }
}