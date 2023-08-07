// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project2/services/service_locator.dart';
import '../bloc/WeatherBloc.dart';
import 'ShowWeatherState.dart';

class SearchPage extends StatelessWidget {
  final getIt = GetIt.instance;

  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    var cityController = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherIsNotSearched) {
              return Container(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset("assets/earth.jpeg"),
                    ),
                    const Text(
                      "Search Weather",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70),
                    ),
                    const Text(
                      "Instantly",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w200,
                          color: Colors.white70),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.white70,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid)),
                        hintText: "City Name",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white70),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.lightBlue),
                          ),
                        ),
                        onPressed: () {
                          //weatherBloc.add(FetchWeather(cityController.text));
                          s1<WeatherBloc>()
                              .add(FetchWeather(cityController.text));
                        },
                        child: const Text(
                          "Search",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is WeatherIsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherIsLoaded) {
              return ShowWeather(state.weatherData, cityController.text);
            } else if (state is WeatherIsError) {
              return Center(
                child: Column(
                  children: [
                    const Text(
                      "Error occurred while fetching weather data try to search again",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //Using service locator
                        //weatherBloc.add(ResetWeather());
                        s1<WeatherBloc>().add(ResetWeather());
                      },
                      child: const Text("Search Again"),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
