
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
            child: Text('상품 상세 보기'),
          ),

        ],
      ),
    );
  }
}
