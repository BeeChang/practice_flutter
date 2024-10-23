import 'package:flutter/material.dart';

import 'DetailScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home, size: 50),
          const Text('홈 화면', style: TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: {
                  'title': '넘기는 값 타이틀 ',
                  'id': 123,
                },
              );
            },
            child: const Text('상세 화면으로 이동'),
          ),
        ],
      ),
    );
  }
}