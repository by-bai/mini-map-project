import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child:  TextField(
                  controller: _cityTextController,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ])
    );
  }

  void _search() {
    _weatherApi.getWeather(_cityTextController.text);
  }
}