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

          ElevatedButton(
            onPressed: () async {
              await _viewModel.fetchUser();
            },
            child: const Text('토큰 갱신'),
          ),

          ElevatedButton(
            onPressed: () async {
              await _viewModel.getUserInformation();
            },
            child: const Text('User 정보 필요'),
          ),
        ],
      ),
    );
  }
}
