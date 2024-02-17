import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather_app/Provider/pro.dart';
import 'package:weather_app/Screens/Setting_Screen.dart';
import 'package:weather_app/repo/repository.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherViewModel(WeatherRepository()),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Roboto',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/settings': (context) => SettingsScreen(),
        },
      ),
    );
  }
}
