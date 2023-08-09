import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project2/services/WeatherRepo.dart';
import '../bloc/WeatherBloc.dart';

GetIt s1 = GetIt.instance;

void setUpLocators() {
  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton(WeatherBloc(WeatherRepo()));
}
