import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:practice_flutter/model/api_response.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:practice_flutter/services/storage/token_storage.dart';
import 'package:synchronized/synchronized.dart';


class AuthInterceptor extends Interceptor {
  final TokenStorage _tokenStorage;
  final Dio _dio;
  final Logger _logger = Logger();
  static final Lock _lock = Lock();

  AuthInterceptor(this._tokenStorage, this._dio);

  Future<AuthResponse?> _refreshToken(String refreshToken) async {
    try {
      final refreshDio = Dio(BaseOptions(
        baseUrl: _dio.options.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 7),
      ));

      final response = await refreshDio.post(
        '/api/refresh',
        data: {'refresh_token': refreshToken},
      );

      if (response.data['code'] == 0) {
        return AuthResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      _logger.e('토큰 갱신 실패: $e');
      return null;
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = _tokenStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      try {
        await _lock.synchronized(() async {

          // 리프레시 토큰 확인
          final refreshToken = _tokenStorage.getRefreshToken();
          if (refreshToken == null) {
            throw DioException(
              requestOptions: error.requestOptions,
              error: '리프레시 토큰이 없습니다.',
            );
          }

          // 토큰 갱신 시도
          final newTokens = await _refreshToken(refreshToken);
          if (newTokens?.data.accessToken != null &&
              newTokens?.data.refreshToken != null) {
            await _tokenStorage.saveTokens(newTokens!.data);
          } else {
            throw DioException(
              requestOptions: error.requestOptions,
              error: '토큰 갱신 실패',
            );
          }
        });

        // Lock 해제 후 새 토큰으로 요청 재시도
        final newToken = _tokenStorage.getAccessToken();
        if (newToken != null) {
          error.requestOptions.headers['Authorization'] = 'Bearer $newToken';
          final response = await _dio.fetch(error.requestOptions);
          handler.resolve(response);
        } else {
          throw DioException(
            requestOptions: error.requestOptions,
            error: '토큰이 없습니다.',
          );
        }
      } catch (e) {
        await _tokenStorage.clearTokens();
        handler.reject(DioException(
          requestOptions: error.requestOptions,
          error: e.toString(),
        ));
      }
    } else {
      handler.next(error);
    }
  }
}
