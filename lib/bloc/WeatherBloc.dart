import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project2/models/WeatherModel.dart';
import 'package:project2/services/WeatherRepo.dart';

class WeatherEvent extends Equatable {
  @override

  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather(this.city);

  @override
  List<Object> get props => [city];
}

class ResetWeather extends WeatherEvent {}

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel weatherData;

  WeatherIsLoaded(this.weatherData);

  @override
  List<Object> get props => [weatherData];
}

class WeatherIsError extends WeatherState {
  final String errorMessage;
  WeatherIsError(this.errorMessage);
}


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeather) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(WeatherIsLoading());
      try {
        WeatherModel weather = await weatherRepo.getWeather(event.city);
        // ignore: invalid_use_of_visible_for_testing_member
        emit(WeatherIsLoaded(
            weather)); // Use WeatherModel instead of Map<String, dynamic>
      } catch (error) {
        // ignore: invalid_use_of_visible_for_testing_member
        emit(WeatherIsError("An error occurred while fetching weather data."));
      }
    } else if (event is ResetWeather) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(WeatherIsNotSearched());
    }
  }
}
