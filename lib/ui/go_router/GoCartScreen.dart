import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/model/CustomData.dart';

class GoCartScreen extends StatelessWidget {
  const GoCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final extraData = state.extra as Map<String, dynamic>?;

    final intValue = extraData?['intValue'] as int? ?? 0;
    final stringValue = extraData?['stringValue'] as String? ?? '';
    final customData = extraData?['customData'] as CustomData?;

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
                context.go(
                  '/search',
                  extra: {'fromCart': true},
                );
              },
              child: const Text('검색화면으로 돌아가기'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
                  '/',
                );
              },
              child: const Text('GO HOME'),
            ),
          ],
        ),
      ),
    );
  }
}