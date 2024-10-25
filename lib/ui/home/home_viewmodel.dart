import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:practice_flutter/model/user.dart';
import 'package:practice_flutter/repository/user_repository.dart';

class HomeViewModel {
  final UserRepository _userRepository;
  final logger = Logger();

  HomeViewModel({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    logger.d('Counter increased: $_counter');
  }

  Future<void> fetchUser() async {
    logger.d('데이터 요청 시작'); // Debug log

    try {
      final result = await _userRepository.getUsers();

      result.when(
        success: (users) {
          logger.i('데이터 요청 성공'); // Info log
          logger.d('받은 데이터: $users'); // Debug log with data


        },
        error: (message) {
          logger.e('데이터 요청 실패: $message'); // Error log
        },
      );
    } catch (e, stackTrace) {
      logger.e('예외 발생', error: e, stackTrace: stackTrace);
    }
  }
}