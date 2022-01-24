class TemperatureInfo {
  final double temp;
  final double feelsLike;

  TemperatureInfo({required this.temp, required this.feelsLike});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    final feelsLike = json['feels_like'];
    return TemperatureInfo(temp: temp, feelsLike: feelsLike);
  }
}