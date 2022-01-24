import 'package:hive/hive.dart';
part 'location_model.g.dart'; // g = generated

@HiveType(typeId: 0)
class Location extends HiveObject {

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double lat;

  @HiveField(3)
  final double lon;

  @HiveField(4)
  final String desc;

  @HiveField(5)
  final String address;

  Location({
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