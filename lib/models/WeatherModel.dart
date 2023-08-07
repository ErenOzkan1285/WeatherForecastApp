class WeatherModel {
  WeatherModel({
    required this.cod,
    required this.message,
    required this.list,
    required this.city,
  });
  late final String cod;
  late final int message;
  late final List<WeatherData> list;
  late final City city;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cod: json['cod'],
      message: json['message'],
      list: List<WeatherData>.from(
          json['list'].map((e) => WeatherData.fromJson(e))),
      city: City.fromJson(json['city']),
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cod'] = cod;
    _data['message'] = message;
    _data['list'] = list.map((e) => e.toJson()).toList();
    _data['city'] = city.toJson();
    return _data;
  }
}

class WeatherData {
  WeatherData({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.dtTxt,
  });
  late final int dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final String? dtTxt;

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather:
          List<Weather>.from(json['weather'].map((e) => Weather.fromJson(e))),
      clouds: Clouds.fromJson(json['clouds']),
      dtTxt: json['dt_txt'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['main'] = main.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds.toJson();
    _data['dt_txt'] = dtTxt;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.feels_like,
  });
  late final num temp;
  late final num tempMin;
  late final num tempMax;
  late final num humidity;
  late final num feels_like;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    humidity = json['humidity'];
    feels_like = json['feels_like'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['humidity'] = humidity;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.country,
    required this.population,
    required this.timezone,
  });
  late final int id;
  late final String name;
  late final String country;
  late final int population;
  late final int timezone;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country'] = country;
    _data['population'] = population;
    _data['timezone'] = timezone;
    return _data;
  }
}

Map<String, dynamic> toJson() {
  final _data = <String, dynamic>{};
  return _data;
}
