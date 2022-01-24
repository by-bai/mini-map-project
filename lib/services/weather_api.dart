import 'package:http/http.dart' as http;

class WeatherApi {
  void getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {'q': city, 'appid': '504c254886c3f04eb67da47ba6d3ee0e'};

    final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
  }
}