import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jtc_mini_project/models/weather/weather_response.dart';

class WeatherApi {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {'q': city, 'appid': '504c254886c3f04eb67da47ba6d3ee0e'};

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    return WeatherResponse.fromJson(jsonDecode(response.body));
  }
}