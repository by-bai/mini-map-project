import 'package:flutter/material.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/screens/Weather/components/weather_body.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
          backgroundColor: kPrimaryColor,
        ),
        body: const WeatherBody());
  }
}
