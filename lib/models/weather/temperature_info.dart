class TemperatureInfo {
  final double temp;
  final double feelsLike;

  TemperatureInfo({required this.temp, required this.feelsLike});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final double temp = json['temp'] as double;
    final double feelsLike = json['feels_like'] as double;
    return TemperatureInfo(temp: temp, feelsLike: feelsLike);
  }
}