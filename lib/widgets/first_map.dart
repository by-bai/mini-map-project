import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FirstMap extends StatefulWidget {
  @override
  State<FirstMap> createState() => FirstMapState();
}

class FirstMapState extends State<FirstMap> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markerList = [];
  List<Object> _markerValues = [
    {'title': 'JTC Summit', 'lat': 1.331340469992664, 'lon': 103.74185756986775},
    {'title': 'West Gate', 'lat': 1.3347265434540927, 'lon': 103.74259696895801},
    {'title': 'JCube', 'lat': 1.3335359655075774, 'lon': 103.74020443847188}];

  static final CameraPosition _JurongEast = CameraPosition(
    target: LatLng(1.3333214468974057, 103.74233947688776), // mrt
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(buildMarkerList(_markerValues, context)),
        initialCameraPosition: _JurongEast,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )
    );
  }

  buildMarkerList(List markerValues, BuildContext context) {
    for (var i = 0; i < _markerValues.length; i++) {
      Map marker = markerValues[i];
      print(marker);
      _markerList.add(Marker(
          markerId: MarkerId(marker['title']),
          position: LatLng(marker['lat'], marker['lon']),
          icon: BitmapDescriptor.defaultMarkerWithHue(215.0),
          onTap: () => showPopUp(context)
      ));
    }
    return _markerList;
  }

  showPopUp(BuildContext context) {

    // set up the button
    Widget button = TextButton(
      child: Text("Close"),
      onPressed: () {
        Navigator.of(context).pop(); //dismiss popup
      },
    );

    // set up the AlertDialog
    AlertDialog popup = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        button,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return popup;
      },
    );
  }

}