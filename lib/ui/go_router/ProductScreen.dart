import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/model/CustomData.dart';


class ProductScreen extends StatelessWidget {
  final String productId;
  final int intValue;
  final String stringValue;
  final CustomData? customData;

  const ProductScreen({
    super.key,
    required this.productId,
    required this.intValue,
    required this.stringValue,
    this.customData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상품 상세 $productId'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('전달받은 정수: $intValue'),
            Text('전달받은 문자열: $stringValue'),
            Text('커스텀 데이터: ID=${customData?.id}, Name=${customData?.name}'),
            ElevatedButton(
              onPressed: () {
                // 장바구니로 이동하면서 데이터 전달
                context.push(
                  '/cart',
                  extra: {
                    'intValue': intValue + 1,  // 값을 약간 수정해서 전달
                    'stringValue': '$stringValue+추가',
                    'customData': customData,
                  },
                );
              },
              child: const Text('장바구니로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}