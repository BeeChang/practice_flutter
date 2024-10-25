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


  Future<void> fetchUser() async {
    logger.d('데이터 요청 시작'); // Debug log

    try {
      final result = await _userRepository.getTokens();

      result.when(
        success: (users) {
          logger.i('데이터 요청 성공');
          logger.d('받은 데이터: $users');
        },
        error: (message) {
          logger.e('데이터 요청 실패: $message');
        },
      );
    } catch (e, stackTrace) {
      logger.e('예외 발생', error: e, stackTrace: stackTrace);
    }
  }


  Future<void> getUserInformation() async {

    try {
      final result = await _userRepository.getUser();

      result.when(
        success: (users) {
          logger.i('데이터 요청 성공');
          logger.d('받은 데이터: $users');
        },
        error: (message) {
          logger.e('데이터 요청 실패: $message');
        },
      );
    } catch (e, stackTrace) {
      logger.e('예외 발생', error: e, stackTrace: stackTrace);
    }
  }





}