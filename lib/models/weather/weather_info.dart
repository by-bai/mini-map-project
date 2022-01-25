class WeatherInfo {
  final String description;

  WeatherInfo({required this.description});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final String description = json['description'].toString();
    return WeatherInfo(description: description);
  }
}