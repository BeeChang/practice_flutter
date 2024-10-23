import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final title = args?['title'] ?? '기본 제목';

    return Scaffold(
      appBar: AppBar(
        title: const Text('상세 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('상세 화면입니다 ${title}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // 뒤로가기
              },
              child: Text('뒤로가기'),
            ),
          ],
        ),
      ),
    );
  }
}