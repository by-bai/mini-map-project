import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/weather/weather_response.dart';
import 'package:jtc_mini_project/services/weather_api.dart';

class WeatherBody extends StatefulWidget {
  const WeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  _WeatherBodyState createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  final _cityTextController = TextEditingController();
  final _weatherApi = WeatherApi();
  WeatherResponse? _weatherResponse;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          controller: _cityTextController,
        ),
      ),
      SizedBox(height: 20),
      ElevatedButton(onPressed: _search, child: Text('Search')),
      SizedBox(height: 20),
      if (_weatherResponse != null)
        Column(children: [
          Text("country: " + _weatherResponse!.cityName),
          Text("currently: " + _weatherResponse!.weatherInfo.description),
          Text("temperature: " + _weatherResponse!.tempInfo.temp.toString()),
          Text("temperature: " +
              _weatherResponse!.tempInfo.feelsLike.toString()),
        ])
    ]));
  }

  Future<void> _search() async {
    final response = await _weatherApi.getWeather(_cityTextController.text);
    setState(() {
      _weatherResponse = response;
    });
  }
}
