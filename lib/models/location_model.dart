class Location {
  final int id;
  final String title;
  final double lat;
  final double lon;
  final String desc;
  final String address;

  const Location({
    required this.id,
    required this.title,
    required this.lat,
    required this.lon,
    required this.desc,
    required this.address
  });

  static Location fromJson(json) => Location(
    id: json['id'],
    title: json['title'],
    lat: json['lat'],
    lon: json['lon'],
    desc: json['desc'],
    address: json['address']
  );
}