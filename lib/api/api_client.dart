import 'package:practice_flutter/model/api_response.dart';
import 'package:practice_flutter/model/auth_token.dart';
import 'package:practice_flutter/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://192.168.0.8:8080/api")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;


  @GET("/getNewToken")
  Future<AuthResponse> getNewToken();

  @POST("/users")
  Future<User> createUser(@Body() User user);

  @POST("/auth/refresh")
  Future<AuthToken> refreshToken(@Body() Map<String, String> refreshToken);
}
