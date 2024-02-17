import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/pro.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _cityController = TextEditingController();
  TextEditingController _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter City:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: 'City',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Enter Country:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _countryController,
              decoration: InputDecoration(
                hintText: 'Country',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final city = _cityController.text;
                final country = _countryController.text;
                await Provider.of<WeatherViewModel>(context, listen: false)
                    .fetchWeatherByLocation(city, country);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    _countryController.dispose();
    super.dispose();
  }
}

class Weather {
  final double temperature;
  final String condition;
  final String location;

  Weather({
    required this.temperature,
    required this.condition,
    required this.location,
  });
}
