import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/widgets/map_dialog.dart';

class FirstMap extends StatefulWidget {
  @override
  State<FirstMap> createState() => FirstMapState();
}

class FirstMapState extends State<FirstMap> {
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    //setCustomMarker();
  }

  List<Marker> _markerList = [];
  List<Map> _markerValues =
  [
    {
      'title': 'JTC Summit',
      'lat': 1.331340469992664,
      'lon': 103.74185756986775,
      'desc': 'JTC Summit is a commercial building.'
    },
    {
      'title': 'West Gate',
      'lat': 1.3347265434540927,
      'lon': 103.74259696895801,
      'desc': 'Westgate is a lifestyle and family shopping mall.'
    },
    {
      'title': 'JCube',
      'lat': 1.3335359655075774,
      'lon': 103.74020443847188,
      'desc': 'JCube offers a good variety of shopping, F&B & entertainment options.'
    }
  ];

  // void setCustomMarker() async {
  //   mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/temp-marker.png');
  // }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      for (var i = 0; i < _markerValues.length; i++) {
        Map marker = _markerValues[i];
        print(marker);
        _markerList.add(Marker(
            markerId: MarkerId(marker['title']),
            position: LatLng(marker['lat'], marker['lon']),
            icon: BitmapDescriptor.defaultMarkerWithHue(215.0),
            onTap: () => showPopUp(context, marker)
        ));
      }});
  }

  static final CameraPosition _JurongEast = CameraPosition(
    target: LatLng(1.3333214468974057, 103.74233947688776), // mrt
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markerList),
        initialCameraPosition: _JurongEast,
        onMapCreated: _onMapCreated
      )
    );
  }

  showPopUp(BuildContext context, Map marker) {

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MapDialog(marker: marker,);
      },
    );
  }

}