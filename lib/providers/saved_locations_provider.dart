import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class SavedLocations with ChangeNotifier {
  List<Location> _savedLocations = [];

  List<Location> get savedLocations => _savedLocations;

  // check whether savedLocations list contains the location
  bool checkLocationExists(Location location) {
    return _savedLocations.any((e) => e.id == location.id) ? true : false;
  }

  void addLocation(Location location) {
    if (checkLocationExists(location)) {
    } else {
      _savedLocations.add(location);
      notifyListeners();
    }
  }

  void addLocationAtIndex(Location location, int index) {
    if (!checkLocationExists(location)) {
      _savedLocations.insert(index, location);
      notifyListeners();
    }
  }

  void removeLocation(Location location) {
    _savedLocations.removeWhere((item) => item.id == location.id);
    notifyListeners();
  }

}