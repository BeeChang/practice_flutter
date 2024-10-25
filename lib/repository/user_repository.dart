import 'package:practice_flutter/api/api_client.dart';
import 'package:practice_flutter/core/network/api_result.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:practice_flutter/model/user.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<ApiResult<AuthResponse>> getUsers() async {
    try {
      final users = await _apiClient.getNewToken();
      return ApiResult.success(users);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }

  Future<ApiResult<User>> createUser(User user) async {
    try {
      final createdUser = await _apiClient.createUser(user);
      return ApiResult.success(createdUser);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}