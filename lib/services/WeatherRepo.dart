import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project2/models/WeatherModel.dart';

class WeatherRepo {
  final _dio = GetIt.I<Dio>();
  Future<WeatherModel> getWeather(String city) async {
    final response = await _dio.request(
      'https://api.openweathermap.org/data/2.5/forecast',
      queryParameters: {
        'q': city,
        'appid': '21b1e841e74c140028309c355d6bcc46',
        'units': 'metric',
        'cnt': '40'
      },
      options: Options(method: 'GET'),
    );

    return WeatherModel.fromJson(response.data);
  }
}
