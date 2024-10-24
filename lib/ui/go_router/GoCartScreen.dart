import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/model/CustomData.dart';

class GoCartScreen extends StatelessWidget {
  final int intValue;
  final String stringValue;
  final CustomData? customData;

  const GoCartScreen({
    super.key,
    required this.intValue,
    required this.stringValue,
    this.customData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
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
                // 검색 화면으로 돌아가기 (스택 초기화)
                context.push(
                  '/search',
                  extra: {'fromCart': true},  // boolean 값 전달
                );
              },
              child: const Text('검색화면으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}