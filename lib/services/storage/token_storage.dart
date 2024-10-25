import 'package:logger/logger.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  final SharedPreferences _prefs;
  final _logger = Logger();

  TokenStorage(this._prefs);

  Future<void> saveTokens(AuthToken tokens) async {
    _logger.d('토큰 저장 시작');
    await _prefs.setString(_accessTokenKey, tokens.accessToken);
    await _prefs.setString(_refreshTokenKey, tokens.refreshToken);
    _logger.i('새 토큰 저장 완료');
  }

  Future<void> clearAccessToken() async {
    await _prefs.remove(_accessTokenKey);
  }

  bool hasAccessToken() {
    final token = getAccessToken();
    final hasToken = token != null && token.isNotEmpty;
    return hasToken;
  }

  String? getAccessToken() {
    return _prefs.getString(_accessTokenKey);
  }

  String? getRefreshToken() {
    return _prefs.getString(_refreshTokenKey);
  }

  Future<void> clearTokens() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
  }
}