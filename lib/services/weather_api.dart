import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:jtc_mini_project/models/weather/weather_response.dart';

class WeatherApi {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {'q': city, 'appid': dotenv.env['WEATHER_API_KEY']};

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WeatherResponse.fromJson(json);
  }
}