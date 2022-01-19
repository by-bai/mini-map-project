import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class SavedLocations with ChangeNotifier {
  List<Location> _savedLocations = [];

  List<Location> get savedLocations => _savedLocations;

  void addLocation(Location location) {
    _savedLocations.add(location);
    notifyListeners();
  }

  void removeLocation(Location location) {
    _savedLocations.removeWhere((item) => item.title == location.title);
    notifyListeners();
  }

}