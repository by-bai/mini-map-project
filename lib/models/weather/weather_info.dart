class WeatherInfo {
  final String description;

  WeatherInfo({required this.description});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    return WeatherInfo(description: description);
  }
}