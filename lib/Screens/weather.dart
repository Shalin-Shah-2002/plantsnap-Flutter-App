// lib/weather_widget.dart

import 'package:flutter/material.dart';
import 'package:plantsnap/api_service.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();
  Future<Map<String, dynamic>>? _weatherData;

  void _fetchWeather() {
    setState(() {
      _weatherData = _apiService.fetchWeather(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            FutureBuilder<Map<String, dynamic>>(
              future: _weatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Text('No data found');
                } else {
                  final weatherData = snapshot.data!;
                  print('Weather data: $weatherData');

                  // Extracting the relevant data
                  final name = weatherData['name'];
                  final main = weatherData['main'];
                  final weather = weatherData['weather'];

                  if (name == null ||
                      main == null ||
                      weather == null ||
                      weather.isEmpty) {
                    return const Text('Incomplete data');
                  }

                  return Column(
                    children: [
                      Text(
                        'City: $name',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Temperature: ${main['temp']}°C'),
                      Text('Weather: ${weather[0]['description']}'),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
