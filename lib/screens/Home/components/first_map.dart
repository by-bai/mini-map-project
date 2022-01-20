import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/providers/map_provider.dart';
import 'package:jtc_mini_project/widgets/bottom_sheet.dart';
import 'package:jtc_mini_project/widgets/map_dialog.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:provider/provider.dart';

class FirstMap extends StatefulWidget {
  const FirstMap({Key? key, required this.locations}) : super(key: key);
  final List<Location> locations;

  @override
  State<FirstMap> createState() => FirstMapState();
}

class FirstMapState extends State<FirstMap> {
  late BitmapDescriptor mapMarker;
  List<Marker> _markerList = [];
  List<Location> _markerValues = [];
  LatLng _cameraPosition = LatLng(1.3540387685146973, 103.86729323027085);
  double _currentZoom = 11.0;
  late GoogleMapController mapController;
  Completer<GoogleMapController> _controller = Completer();

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
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => MapBottomSheet(marker: marker),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        //onTap: () => showPopUp(context, marker)
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final mapService = Provider.of<MapProvider>(context, listen: false);

    print("map built");
    return
          Scaffold(
              body: GoogleMap(
                mapType: MapType.normal,
                markers: Set.from(_markerList),
                initialCameraPosition: CameraPosition(
                  target: _cameraPosition, // mrt
                  zoom: _currentZoom,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await Navigator.pushNamed(context, '/saved');
                setState(() {
                  _cameraPosition = mapService.cameraPosition;
                  _currentZoom = mapService.cameraZoom;
                });
                _goToLocation();
                print(mapService.cameraPosition);
                print(mapService.cameraZoom);

              },
              label: Text('Favourites!'),
              icon: Icon(Icons.directions_boat),
            ),
    );
  }

  Future<void> _goToLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _cameraPosition, zoom: _currentZoom)));
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