import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:project2/bloc/WeatherBloc.dart';
import 'package:project2/core/dio_manager/dio_http_client.dart';
import 'package:project2/services/WeatherRepo.dart';
import 'package:project2/core/constants/app_constants.dart';

GetIt getIt = GetIt.instance;

void configureInjection() async {
  var baseOptions = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: {"Accept": "application/json"},
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json);

  final dio = Dio(baseOptions);
  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<DioHttpClient>(() => DioHttpClient(getIt<Dio>()));
  getIt.registerLazySingleton<WeatherBloc>(
      () => WeatherBloc(getIt<WeatherRepo>()));
  getIt.registerLazySingleton<WeatherRepo>(
      () => WeatherRepo(getIt<DioHttpClient>()));
}
