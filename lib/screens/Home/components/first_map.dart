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

  @override
  void initState() {
    super.initState();
    _markerValues = widget.locations;
  }

  void _onMapCreated(GoogleMapController controller) {
    print("Map has been initialized");
    setState(() {
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
      }});
  }


  @override
  Widget build(BuildContext context) {

    return Consumer<MapProvider>(
      builder: (context, cameraConfig, child) =>
          Scaffold(
              body: GoogleMap(
                mapType: MapType.normal,
                markers: Set.from(_markerList),
                initialCameraPosition: CameraPosition(
                  target: cameraConfig.cameraPosition, // mrt
                  zoom: cameraConfig.cameraZoom,
                ),
                onMapCreated: _onMapCreated
              )
    ));
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