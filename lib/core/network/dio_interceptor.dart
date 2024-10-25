import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:practice_flutter/model/api_response.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:practice_flutter/services/storage/token_storage.dart';
import 'package:synchronized/synchronized.dart';

class AuthInterceptor extends QueuedInterceptor {
  final TokenRefreshManager _tokenManager;
  final TokenStorage _tokenStorage;
  final Dio _dio; // Dio 추가
  final Queue<RequestOptions> _queue = Queue<RequestOptions>();
  final Logger _logger = Logger();

  AuthInterceptor(this._tokenManager, this._tokenStorage, this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = _tokenStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    _logger.i('⛔요청 시작  [Request Hash: ${options.hashCode} ');
    handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      final requestOptions = error.requestOptions;

      _logger.d('⛔401 에러 감지 [Request Hash: ${requestOptions.hashCode}]:\n'
          '요청 경로: ${requestOptions.path}\n'
          '요청 방식: ${requestOptions.method}');
      _queue.add(requestOptions);

      // 문제 있는 에세스토큰 제거
      await _tokenStorage.clearAccessToken();

      try {
        final authResponse = await _tokenManager.refreshToken();
        _logger.i('⛔새 토큰 발급 성공');

        // 큐에 있는 모든 실패한 요청을 새 토큰으로 재시도
        while (_queue.isNotEmpty) {
          final request = _queue.removeFirst();
          _logger.i('⛔재시도 [Request Hash: ${request.hashCode}]');
          request.headers['Authorization'] =
              'Bearer ${authResponse.data.accessToken}';
          try {
            final response = await _dio.fetch(request);
            handler.resolve(response);
          } catch (e) {
            handler.reject(
              DioException(
                requestOptions: request,
                error: e.toString(),
              ),
            );
          }
        }
      } catch (e) {
        _logger.e('⛔새 토큰 발급 실패');
        await _tokenStorage.clearTokens();
        while (_queue.isNotEmpty) {
          final request = _queue.removeFirst();
          handler.reject(
            DioException(
              requestOptions: request,
              error: '토큰 갱신 실패: $e',
            ),
          );
        }
      } finally{
        _logger.e('⛔finally  [Request Hash: ${requestOptions.hashCode}] ');
      }
    } else {
      handler.next(error);
    }
  }
}

class TokenRefreshManager {
  static TokenRefreshManager? _instance;
  static final _lock = Lock();

  final TokenStorage _tokenStorage;
  final Dio _refreshDio;
  final logger = Logger();

  static const String _refreshUrl = '/api/refresh';

  TokenRefreshManager._({
    required TokenStorage tokenStorage,
    required String baseUrl,
  })  : _tokenStorage = tokenStorage,
        _refreshDio = Dio(BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 7),
        ));

  //싱글톤으로 사용
  static Future<TokenRefreshManager> getInstance({
    required TokenStorage tokenStorage,
    required String baseUrl,
  }) async {
    if (_instance == null) {
      await _lock.synchronized(() async {
        _instance ??= TokenRefreshManager._(
          tokenStorage: tokenStorage,
          baseUrl: baseUrl,
        );
      });
    }
    return _instance!;
  }

  Future<AuthResponse> refreshToken() async {
    return await _lock.synchronized(() async {
      try {
        final refreshToken = _tokenStorage.getRefreshToken();
        if (refreshToken == null) {
          throw DioException(
            requestOptions: RequestOptions(path: _refreshUrl),
            message: '리프레시 토큰이 없습니다',
          );
        }

        // 에세스 토큰이 존재하면 정상적인 상황이므로 코드 종료
        if (_tokenStorage.hasAccessToken()) {
          logger.e('⛔ 토큰존재해서 에러터트림 ');
          throw DioException(
            requestOptions: RequestOptions(path: _refreshUrl),
            message: '토큰 존재',
          );
        }

        try {
          final response = await _refreshDio
              .post(_refreshUrl, data: {'refresh_token': refreshToken});
          final authResponse = AuthResponse.fromJson(response.data);

          if (authResponse.code == 0) {
            await _tokenStorage.saveTokens(authResponse.data);
            return authResponse;
          } else {
             throw DioException(
              requestOptions: RequestOptions(path: _refreshUrl),
              message: authResponse.message,
            );
          }
        } on DioException catch (e) {
           throw DioException(
            requestOptions: RequestOptions(path: _refreshUrl),
            message: '토큰 갱신 서비스를 찾을 수 없습니다',
          );
        }
      } catch (e) {
        logger.e('⛔ 토큰 갱신 중 에러 발생: ${e}');
        rethrow;
      }
    });
  }
}
