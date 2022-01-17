class Location {
  final String title;
  final double lat;
  final double lon;
  final String desc;

  const Location({
    required this.title,
    required this.lat,
    required this.lon,
    required this.desc
  });

  static Location fromJson(json) => Location(
    title: json['title'],
    lat: json['lat'],
    lon: json['lon'],
    desc: json['desc']
  );
}