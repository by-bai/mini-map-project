import 'package:jtc_mini_project/models/location_model.dart';

import '../boxes.dart';

// checks if location exists in Hive savedlocations
bool checkLocationExists(Location location) {
  final box = Boxes.getSavedLocations();
  final savedLocations = box.values.toList().cast<Location>();
  return savedLocations.any((e) => e.id == location.id) ? true : false;
}
