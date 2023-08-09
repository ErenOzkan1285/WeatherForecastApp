// ignore_for_file: file_names

// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'WeatherModel.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel {
  WeatherModel({
    this.cod,
    this.message,
    this.list,
    this.city,
  });
  final String? cod;
  final int? message;
  final List<WeatherData>? list;

  @JsonKey(fromJson: _cityFromJson, toJson: _cityToJson)
  @CityConverter()
  final City? city;

  factory WeatherModel.fromJson(Map<String, dynamic> data) =>
      _$WeatherModelFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  static City _cityFromJson(Map<String, dynamic> json) {
    return City.fromJson(json);
  }

  static Map<String, dynamic> _cityToJson(City city) {
    return city.toJson();
  }
}

@JsonSerializable(explicitToJson: true)
class WeatherData {
  WeatherData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.dtTxt,
  });
  final int dt;
  final Main main;
  final List<Weather> weather;
  final Clouds clouds;
  @JsonKey(name: "dt_txt")
  final String? dtTxt;

  factory WeatherData.fromJson(Map<String, dynamic> data) =>
      _$WeatherDataFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class Main {
  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    // ignore: non_constant_identifier_names
    required this.feels_like,
  });
  final double? temp;
  @JsonKey(name: "temp_min")
  final double? tempMin;
  @JsonKey(name: "temp_max")
  final double? tempMax;
  final int? humidity;
  // ignore: non_constant_identifier_names
  final double? feels_like;

  factory Main.fromJson(Map<String, dynamic> data) => _$MainFromJson(data);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  final int id;
  final String main;
  final String description;
  final String icon;

  factory Weather.fromJson(Map<String, dynamic> data) =>
      _$WeatherFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Clouds {
  Clouds({
    required this.all,
  });
  final int all;

  factory Clouds.fromJson(Map<String, dynamic> data) => _$CloudsFromJson(data);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class City {
  City({
    this.id,
    this.name,
    this.country,
    this.population,
    this.timezone,
  });
  final int? id;
  final String? name;
  final String? country;
  final int? population;
  final int? timezone;

  factory City.fromJson(Map<String, dynamic> data) => _$CityFromJson(data);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

class CityConverter implements JsonConverter<City, Map<String, dynamic>> {
  const CityConverter();

  @override
  City fromJson(Map<String, dynamic> json) {
    return City.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(City city) {
    return city.toJson();
  }
}
