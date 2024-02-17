import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/pro.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherViewModel>(
        builder: (context, viewModel, _) {
          final weather = viewModel.weather;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (viewModel.isLoading) const CircularProgressIndicator(),
                Text(
                  '${weather.temperature}°C',
                  style: const TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 16),
                Text(
                  weather.condition,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                Text(
                  weather.location,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => viewModel.refreshWeather(),
                  child: const Text('Refresh'),
                ),
                if (viewModel.error.isNotEmpty)
                  Text(
                    viewModel.error,
                    style: const TextStyle(color: Colors.red),
                  ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: const Text('Settings'))
              ],
            ),
          );
        },
      ),
    );
  }
}
