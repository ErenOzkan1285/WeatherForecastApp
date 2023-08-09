import 'dart:developer';
import 'dart:io';

import 'package:project2/core/dio_manager/dio_http_client.dart';
import 'package:project2/models/WeatherModel.dart';

class WeatherRepo {
  DioHttpClient? _dioHttpClient;
  WeatherRepo(DioHttpClient dioHttpClient) {
    _dioHttpClient = dioHttpClient;
  }

  Future<WeatherModel> getWeather(String city) async {
    try {
      final response = await _dioHttpClient!.get(
        'data/2.5/forecast',
        queryParams: {
          'q': city,
          'appid': '21b1e841e74c140028309c355d6bcc46',
          'units': 'metric',
          'cnt': '40'
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        return WeatherModel.fromJson(response.data);
      }
      return WeatherModel();
    } catch (e) {
      log(e.toString());
      return WeatherModel();
    }
  }
}
