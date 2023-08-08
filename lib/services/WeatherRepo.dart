import 'dart:math';

import 'package:dio/dio.dart';
import 'package:project2/models/WeatherModel.dart';

class WeatherRepo {
  final Dio _dio = Dio();

  Future<WeatherModel> getWeather(String city) async {
    final baseUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=21b1e841e74c140028309c355d6bcc46&units=metric&cnt=40';

    try {
      final result = await _dio.get(baseUrl);

      if (result.statusCode != 200) {
        throw Exception("Failed to load weather data!");
      }

      return WeatherModel.fromJson(result.data);
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        // Eğer API'den dönen hata mesajı varsa bu kısımda yakalayabilirsiniz.
        throw Exception("API Error: ${dioError.response!.data}");
      } else {
        // Diğer hata türlerini burada yakalayabilirsiniz.
        throw Exception("An error occurred while fetching weather data.");
      }
    } catch (error) {
      throw Exception("An error occurred while fetching weather data.2");
    }
  }
}
