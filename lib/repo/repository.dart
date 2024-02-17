import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_app/weather_model.dart';

class WeatherRepository {
  static const String _apiKey = '09f7fdd070fcff3017870029c033a4f1';
  static const String _apiUrl =
      'http://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(
      {required double latitude, required double longitude}) async {
    final response = await http.get(
      '$_apiUrl?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric'
          as Uri,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Weather(
        temperature: jsonData['main']['temp'],
        condition: jsonData['weather'][0]['main'],
        location: '${jsonData['name']}, ${jsonData['sys']['country']}',
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<Weather> fetchWeatherByLocation(
      {required String city, required String country}) async {
    final response = await http.get(
      '$_apiUrl?q=$city,$country&appid=$_apiKey&units=metric' as Uri,
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Weather(
        temperature: jsonData['main']['temp'],
        condition: jsonData['weather'][0]['main'],
        location: '${jsonData['name']}, ${jsonData['sys']['country']}',
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
