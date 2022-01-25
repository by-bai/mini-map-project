import 'package:hive/hive.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class Boxes {
  static Box<Location> getSavedLocations() =>
      Hive.box<Location>('savedlocations');
}