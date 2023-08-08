import 'package:flutter/material.dart';
import 'package:project2/bloc/WeatherBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/screens/SearchPage.dart';
import 'package:project2/services/service_locator.dart';

void main() {
  setUpLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 8, 55, 136),
        body: BlocProvider(
          create: (context) => s1<WeatherBloc>(),
          child: SearchPage(),
        ),
      ),
    );
  }
}
