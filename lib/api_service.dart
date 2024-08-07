// lib/api_service.dart

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiKey = 'eda4cf5b62mshb795338831ffd19p153930jsn057a262c0038';
  final String apiHost = 'open-weather13.p.rapidapi.com';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('https://$apiHost/city/$city/EN'),
      headers: {
        'X-Rapidapi-Key': apiKey,
        'X-Rapidapi-Host': apiHost,
      },
    );

    if (response.statusCode == 200) {
       print('Response body: ${response.body}');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
