
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:practice_flutter/di/service_locator.dart';
import 'package:practice_flutter/repository/user_repository.dart';
import 'package:practice_flutter/ui/home/home_viewmodel.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel(
      userRepository: getIt<UserRepository>(),
    );
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

          Text(
            '현재 카운터: ${_viewModel.counter}',
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

          ElevatedButton(
            onPressed: () {
              _viewModel.incrementCounter();
              setState(() {}); // UI 업데이트를 위해 setState 호출
            },
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
              await _viewModel.fetchUser();
              // 필요한 경우 setState 호출
              // setState(() {});
            },
            child: const Text('데이터받기 (로그 확인)'),
          ),
          const Text(
            '데이터는 디버그 콘솔에서 확인해주세요',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}