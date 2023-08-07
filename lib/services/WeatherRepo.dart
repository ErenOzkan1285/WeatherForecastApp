import 'package:dio/dio.dart';
import 'package:project2/models/WeatherModel.dart';

class WeatherRepo {
  final Dio _dio = Dio();

  Future<WeatherModel> getWeather(String city) async {
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=21b1e841e74c140028309c355d6bcc46&units=metric&cnt=40';

    final result = await _dio.get(baseUrl);

    if (result.statusCode != 200) {
      throw Exception("Failed to load weather data!");
    }

    return WeatherModel.fromJson(result.data);
  }
}
