import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:practice_flutter/api/api_client.dart';
import 'package:practice_flutter/core/network/dio_interceptor.dart';
import 'package:practice_flutter/repository/fake_state_repository.dart';
import 'package:practice_flutter/repository/user_repository.dart';
import 'package:practice_flutter/services/storage/token_storage.dart';
import 'package:practice_flutter/ui/state_check/provider/ProviderViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // SharedPreferences 초기화
  final prefs = await SharedPreferences.getInstance();

  // TokenStorage 등록
  getIt.registerSingleton<TokenStorage>(TokenStorage(prefs));

  // Dio 설정
  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.0.8:8080',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 7),
  ));

  // AuthInterceptor 설정
  dio.interceptors.add(AuthInterceptor(
    getIt<TokenStorage>(),
    dio,
  ));

  // ApiClient 등록
  getIt.registerSingleton<ApiClient>(ApiClient(dio));

  // Respository
  getIt.registerSingleton<UserRepository>(
    UserRepository(
      getIt<ApiClient>(),
      getIt<TokenStorage>(),
    ),
  );

  getIt.registerLazySingleton<FakeStateRepository>(
    () => FakeStateRepository(),
  );

// ViewModel
  getIt.registerFactory<ProviderViewModel>(
    () => ProviderViewModel(repository: getIt<FakeStateRepository>()),
  );
}
