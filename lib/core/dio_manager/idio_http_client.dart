import 'package:dio/dio.dart';

abstract class IDioHttpClient {
  abstract int receiveTimeout;
  abstract int connectTimeout;
  abstract int sendTimeout;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParams, Options? options});
}
