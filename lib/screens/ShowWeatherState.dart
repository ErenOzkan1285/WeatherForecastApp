// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project2/core/app_configuration/dependency_configuration.dart';
import '../bloc/WeatherBloc.dart';
import '../models/WeatherModel.dart';
import 'package:project2/core/constants/view_photos_widget.dart';
import 'popup_widget.dart';
import 'package:project2/core/constants/app_constants.dart';

class _ShowWeatherState extends State<ShowWeather> {
  String getDayOfWeekFromEpoch(int epoch) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
    int dayOfWeek = dateTime.weekday - 1;

    List<String> days = [
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
      'Sun',
    ];

    // Return the day name
    return days[dayOfWeek];
  }

  // Create a list of day names
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  bool isImageLoading = true;
  @override
  Widget build(BuildContext context) {
    List<String> currentDays = [
      getDayOfWeekFromEpoch(((widget.weather.list ?? []))[3].dt.toInt()),
      getDayOfWeekFromEpoch(((widget.weather.list ?? []))[11].dt.toInt()),
      getDayOfWeekFromEpoch(((widget.weather.list ?? []))[19].dt.toInt()),
      getDayOfWeekFromEpoch(((widget.weather.list ?? []))[27].dt.toInt()),
      getDayOfWeekFromEpoch(((widget.weather.list ?? []))[35].dt.toInt()),
    ];

    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 8, 55, 136),
          height: MediaQuery.of(context).size.height - 130,
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.only(top: 40, left: 0, right: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Results for: ${widget.weather.city?.name}, ${widget.weather.city?.country}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[200]),
                      ),
                    ),
                  ),
                ],
              ),
             
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "${Constants.baseUrl}img/w/${((widget.weather.list ?? []))[0].weather[0].icon}.png",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                        width: 150,
                        height: 150,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${(widget.weather.list ?? [])[0].main.temp!.round()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.grey[200]),
                              ),
                              Text(
                                "°C",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    color: Colors.grey[200]),
                              ),
                            ],
                          ),
                          Text(
                            "Max: ${(widget.weather.list ?? [])[0].main.tempMax!.round()}°C ",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Min:  ${(widget.weather.list ?? [])[0].main.tempMin!.round()}°C ",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Humidity:  %${(widget.weather.list ?? [])[0].main.humidity} ",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Description:  ${(widget.weather.list ?? [])[0].weather[0].description.toUpperCase()} ",
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Date:  ${(widget.weather.list ?? [])[0].dtTxt} ",
                            style: const TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ShowDetailsDialog(
                                    weather: widget.weather,
                                    currentDays: currentDays,
                                  ); // Ayrı bir widget çağırılıyor
                                },
                              );
                            },
                            child: Text("Details"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 70,
                              width: 70,
                              child: Text(
                                getDayOfWeekFromEpoch(
                                    (widget.weather.list ?? [])[3].dt.toInt()),
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 70,
                              width: 70,
                              child: Text(
                                getDayOfWeekFromEpoch(
                                    (widget.weather.list ?? [])[11].dt.toInt()),
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 70,
                              width: 70,
                              child: Text(
                                getDayOfWeekFromEpoch(
                                    (widget.weather.list ?? [])[19].dt.toInt()),
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 70,
                              width: 70,
                              child: Text(
                                getDayOfWeekFromEpoch(
                                    (widget.weather.list ?? [])[27].dt.toInt()),
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: 70,
                              width: 70,
                              child: Text(
                                getDayOfWeekFromEpoch(
                                    (widget.weather.list ?? [])[35].dt.toInt()),
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          PhotoView(
                              icon: (widget.weather.list ?? [])[4]
                                  .weather[0]
                                  .icon),
                          Row(
                            children: [
                              Text(
                                "${(widget.weather.list ?? [])[3].main.tempMax!.round()}°C ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${(widget.weather.list ?? [])[3].main.feels_like!.round()}°C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PhotoView(
                              icon: (widget.weather.list ?? [])[8]
                                  .weather[0]
                                  .icon),
                          Row(
                            children: [
                              Text(
                                "${(widget.weather.list ?? [])[11].main.tempMax!.round()}°C ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${(widget.weather.list ?? [])[11].main.feels_like!.round()}°C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PhotoView(
                              icon: (widget.weather.list ?? [])[12]
                                  .weather[0]
                                  .icon),
                          Row(
                            children: [
                              Text(
                                "${(widget.weather.list ?? [])[19].main.tempMax!.round()}°C ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${(widget.weather.list ?? [])[19].main.feels_like!.round()}°C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PhotoView(
                              icon: (widget.weather.list ?? [])[16]
                                  .weather[0]
                                  .icon),
                          Row(
                            children: [
                              Text(
                                "${(widget.weather.list ?? [])[27].main.tempMax!.round()}°C ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${(widget.weather.list ?? [])[27].main.feels_like!.round()}°C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          PhotoView(
                              icon: (widget.weather.list ?? [])[20]
                                  .weather[0]
                                  .icon),
                          Row(
                            children: [
                              Text(
                                "${(widget.weather.list ?? [])[35].main.tempMax!.round()}°C ",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "${(widget.weather.list ?? [])[35].main.feels_like!.round()}°C",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            //BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
            getIt<WeatherBloc>().add(ResetWeather());
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              backgroundColor: Colors.blue,
              fixedSize: Size(MediaQuery.of(context).size.width - 120, 20)),
          child: const Text(
            "Go back to search",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types

class ShowWeather extends StatefulWidget {
  final WeatherModel weather;
  final city;

  const ShowWeather(this.weather, this.city, {super.key});

  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}
