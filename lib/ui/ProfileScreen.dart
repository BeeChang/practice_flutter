import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter/ui/go_router/GoCartScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person, size: 50),
          const Text('프로필 화면', style: TextStyle(fontSize: 24)),
          ElevatedButton(
            onPressed: () async {
              context.push('/profile/info');
            },
            child: const Text('다음 이너 프로필'),
          ),
        ],
      ),
    );
  }
}