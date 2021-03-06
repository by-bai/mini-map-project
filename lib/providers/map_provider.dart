import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider with ChangeNotifier {
  LatLng _cameraPosition = LatLng(1.3540387685146973, 103.86729323027085);
  double _currentZoom = 11.0;
  bool _runAnimateCamera = false;

  LatLng get cameraPosition => _cameraPosition;
  double get cameraZoom => _currentZoom;
  bool get runAnimateCamera => _runAnimateCamera;

  void updatePosition (double lat, double lon) {
    _cameraPosition = LatLng(lat, lon);
    notifyListeners();
  }

  void updateZoom (double zoomLevel) {
    _currentZoom = zoomLevel;
    notifyListeners();
  }

  void updateRunAnimateCamera() {
    _runAnimateCamera = !_runAnimateCamera;
  }

}