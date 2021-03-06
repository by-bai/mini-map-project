import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondMap extends StatefulWidget {
  @override
  State<SecondMap> createState() => SecondMapState();
}

class SecondMapState extends State<SecondMap> {
  List<Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          initialCameraPosition: CameraPosition(target: LatLng(40.7128, -74.0060)),
          onTap: _handleTap,
          markers: Set.from(myMarker),
        )
    );
  }

  _handleTap(LatLng tappedPoint) {
    print(tappedPoint);
    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(
          markerId: MarkerId(tappedPoint.toString()),
          position: tappedPoint,
          infoWindow: InfoWindow(title: tappedPoint.toString()),));
    });
  }
}