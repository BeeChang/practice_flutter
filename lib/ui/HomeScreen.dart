
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'go_router/GoRouter.dart';
import 'route/DetailScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0; // 카운터 상태 추가

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    // 홈 화면이 처음 로드되면 초기화 완료로 설정
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 50),
          const Text('홈 화면', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),

          // 카운터 표시 추가
          Text(
            '현재 카운터: $_counter',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Text(
            '카운터되는지확인',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20),

          // 증가 버튼 추가
          ElevatedButton(
            onPressed: _incrementCounter,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              '숫자 증가',
              style: TextStyle(fontSize: 16),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () async {
              // 상세 화면으로 이동하고 결과 받기
              // final result = await Navigator.pushNamed(
              //   context,
              //   '/detail',
              //   arguments: {'productId': 99999999},
              // ) as Map<String, dynamic>?;
              //
              // Logger().e('상세화면에서 돌아옴');
              // Logger().e('result: $result');
              //
              // if (result != null) {
              //   // 상세 화면에서 전달받은 데이터 처리
              //   Logger().e('마지막으로 본 상품: ${result['lastViewedProduct']}');
              //   Logger().e('조회 시간: ${result['timestamp']}');
              // }
            },
            child: const Text('상품 상세 보기'),
          ),
        ],
      ),
    );
  }
}