import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/providers/map_provider.dart';
import 'package:jtc_mini_project/widgets/bottom_sheet.dart';
import 'package:jtc_mini_project/widgets/map_dialog.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:provider/provider.dart';

class FirstMap extends StatefulWidget {
  FirstMap({Key? key, required this.locations, required this.controller, required this.animateCamera}) : super(key: key);
  final List<Location> locations;
  Completer<GoogleMapController> controller;
  Function(LatLng, double) animateCamera;

  @override
  State<FirstMap> createState() => FirstMapState();
}

class FirstMapState extends State<FirstMap> {
  late BitmapDescriptor mapMarker;
  List<Marker> _markerList = [];
  List<Location> _markerValues = [];
  LatLng _initialPosition = LatLng(1.3540387685146973, 103.86729323027085);
  double _initialZoom = 11.0;


  @override
  void initState() {
    super.initState();
    _markerValues = widget.locations;
    for (var i = 0; i < _markerValues.length; i++) {
      Location marker = _markerValues[i];
      print(marker);
      _markerList.add(Marker(
        markerId: MarkerId(marker.title),
        position: LatLng(marker.lat, marker.lon),
        icon: BitmapDescriptor.defaultMarkerWithHue(215.0),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => MapBottomSheet(marker: marker),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
          widget.animateCamera(LatLng(marker.lat, marker.lon), 16);
        }
        //onTap: () => showPopUp(context, marker)
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final mapService = Provider.of<MapProvider>(context, listen: false);

    return
          Scaffold(
              body: Stack(children: <Widget>[
                GoogleMap(
                mapType: MapType.normal,
                  markers: Set.from(_markerList),
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition, // mrt
                    zoom: _initialZoom,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    widget.controller.complete(controller);
                  },
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      widget.animateCamera(_initialPosition, _initialZoom);
                      print(mapService.cameraPosition);
                      print(mapService.cameraZoom);
                    },
                    label: Icon(Icons.maps_home_work_sharp),
                    backgroundColor: kPrimaryColor,
                  ),

                )
              ])
    );
  }

  showPopUp(BuildContext context, Location marker) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MapDialog(marker: marker,);
      },
    );
  }

}