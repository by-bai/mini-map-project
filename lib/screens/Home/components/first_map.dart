import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/widgets/bottom_sheet.dart';
import 'package:jtc_mini_project/widgets/map_dialog.dart';
import 'package:jtc_mini_project/models/location_model.dart';

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
  LatLng _currentPosition = LatLng(1.3540387685146973, 103.86729323027085);
  double _currentZoom = 11;

  @override
  void initState() {
    super.initState();
    _markerValues = widget.locations;
    //setCustomMarker();

  }

  @override
  void didChangeDependencies() {
    final Location? dataFromSaved = ModalRoute.of(context)?.settings.arguments as Location?;
    setState(() {
      if (dataFromSaved != null) {
        _currentPosition = LatLng(dataFromSaved!.lat, dataFromSaved!.lon);
        _currentZoom = 16;
      }
    });
  }

  // void setCustomMarker() async {
  //   mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/temp-marker.png');
  // }


  void _onMapCreated(GoogleMapController controller) {
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
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markerList),
        initialCameraPosition: CameraPosition(
          target: _currentPosition, // mrt
          zoom: _currentZoom,
        ),
        onMapCreated: _onMapCreated
      )
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