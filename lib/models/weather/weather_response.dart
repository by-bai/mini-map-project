// {
//   "weather": [
//     {
//       "description": "clear sky",
//     }
//   ],
//   "main": {
//     "temp": 282.55,
//     "feels_like": 281.86,
//   },
//   "name": "Mountain View",
//

import 'package:jtc_mini_project/models/weather/temperature_info.dart';
import 'package:jtc_mini_project/models/weather/weather_info.dart';

class WeatherResponse {

  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse(
      {
        required this.cityName,
        required this.tempInfo,
        required this.weatherInfo
      });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'].toString();

    final weatherInfoJson = json['weather'][0] as Map<String, dynamic>; //important! List<dynamic> type

    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    final tempInfoJson = json['main'] as Map<String, dynamic>;
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    return WeatherResponse(cityName: cityName, weatherInfo: weatherInfo, tempInfo: tempInfo);
  }



}