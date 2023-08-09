import 'package:dio/dio.dart';
//import 'package:project2/core/dio_manager/idio_http_client.dart';

class DioHttpClient {
  final Dio _dio;
  DioHttpClient(this._dio);

  int connectTimeout = 15000;
  int receiveTimeout = 15000;
  int sendTimeout = 15000;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParams, Options? options}) async {
    final Response response =
        await _dio.get(path, queryParameters: queryParams, options: options);
    return response;
  }
}
