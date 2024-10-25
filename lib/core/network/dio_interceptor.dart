import 'package:dio/dio.dart';
import 'package:practice_flutter/model/api_response.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:practice_flutter/services/storage/token_storage.dart';

class AuthInterceptor extends QueuedInterceptor {
  final TokenStorage _tokenStorage;
  final Dio _dio;
  final String _refreshUrl;
  bool _isRefreshing = false;
  final _queue = <RequestOptions>[];

  AuthInterceptor(this._tokenStorage, this._dio, this._refreshUrl);

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
      final requestOptions = error.requestOptions;

      _queue.add(requestOptions);

      if (!_isRefreshing) {
        _isRefreshing = true;
        try {
          final refreshToken = _tokenStorage.getRefreshToken();
          if (refreshToken == null) {
            handler.reject(
                DioException(requestOptions: requestOptions)
            );
            return;
          }

          final response = await _dio.post(_refreshUrl,
              data: {'refresh_token': refreshToken}
          );

          final ApiResponse<AuthToken> apiResponse = ApiResponse.fromJson(
              response.data,
                  (json) => AuthToken.fromJson(json as Map<String, dynamic>)
          );

          await _tokenStorage.saveTokens(apiResponse.data);

          // Retry all queued requests
          for (var request in _queue) {
            request.headers['Authorization'] = 'Bearer ${apiResponse.data.accessToken}';
            await _dio.fetch(request);
          }
        } catch (e) {
          await _tokenStorage.clearTokens();
          for (var request in _queue) {
            handler.reject(
                DioException(
                  requestOptions: request,
                  error: e.toString(),
                )
            );
          }
        } finally {
          _isRefreshing = false;
          _queue.clear();
        }
      }
    } else {
      handler.next(error);
    }
  }
}