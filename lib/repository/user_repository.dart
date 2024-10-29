import 'package:practice_flutter/api/api_client.dart';
import 'package:practice_flutter/core/network/api_result.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:practice_flutter/model/user.dart';
import 'package:practice_flutter/services/storage/token_storage.dart';
import 'package:logger/logger.dart';

class UserRepository {
  final ApiClient _apiClient;
  final TokenStorage _tokenStorage;
  final logger = Logger();

  UserRepository(
    this._apiClient,
    this._tokenStorage,
  );

  Future<ApiResult<AuthResponse>> getTokens() async {
    try {
      final token = await _apiClient.getNewToken();
      _tokenStorage.saveTokens(
          token.data,
      );
      return ApiResult.success(token);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }

  Future<ApiResult<User>> getUser({String query = "test"}) async {
    try {
      final res = await _apiClient.getUser(query);
      return ApiResult.success(res.user);
    } catch (e, stackTrace) {
      logger.e('예외 발생', error: e, stackTrace: stackTrace);
      return ApiResult.error(e.toString());
    }
  }

  Future<ApiResult<User>> getFriend({String query = "test"}) async {
    try {
      final res = await _apiClient.getFriend(query);
      return ApiResult.success(res.user);
    } catch (e, stackTrace) {
      logger.e('예외 발생', error: e, stackTrace: stackTrace);
      return ApiResult.error(e.toString());
    }
  }
}
