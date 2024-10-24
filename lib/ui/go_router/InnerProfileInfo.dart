import 'package:flutter/cupertino.dart';

class InnerProfileInfo extends StatelessWidget {
  const InnerProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('프로필 INNER INFO', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}