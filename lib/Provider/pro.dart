import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/repo/repository.dart';

import 'package:weather_app/weather_model.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _repository;
  String _error = '';
  bool _isLoading = false;

  WeatherViewModel(this._repository) {
    _getCurrentLocationWeather();
  }

  Weather _weather = Weather(temperature: 0, condition: '', location: '');

  Weather get weather => _weather;
  String get error => _error;
  bool get isLoading => _isLoading;

  Future<void> _getCurrentLocationWeather() async {
    try {
      _isLoading = true;
      notifyListeners();

      final position = await Geolocator.getCurrentPosition();
      final weatherData = await _repository.fetchWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      _weather = weatherData;
    } catch (e) {
      _error = 'Error fetching weather: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshWeather() async {
    await _getCurrentLocationWeather();
  }

  Future<void> fetchWeatherByLocation(String city, String country) async {
    try {
      _isLoading = true;
      notifyListeners();

      final weatherData = await _repository.fetchWeatherByLocation(
        city: city,
        country: country,
      );
      _weather = weatherData;
    } catch (e) {
      _error = 'Error fetching weather: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
