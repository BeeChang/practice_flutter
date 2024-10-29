

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateMainScreen extends StatelessWidget {
  const StateMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('상태라이브러리 메인', style: TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () async {

             },
            child: const Text(' '),
          ),
        ],
      ),
    );
  }
}