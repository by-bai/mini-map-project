import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/providers/saved_locations_provider.dart';
import 'package:jtc_mini_project/widgets/map_dialog.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:provider/src/provider.dart';

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
    //setCustomMarker();
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
              builder: (context) => buildSheet(marker),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            //onTap: () => showPopUp(context, marker)
        ));
      }});
  }

  static final CameraPosition _Singapore = CameraPosition(
    target: LatLng(1.3540387685146973, 103.86729323027085), // mrt
    zoom: 11,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_markerList),
        initialCameraPosition: _Singapore,
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

  buildSheet(Location marker) => Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 30),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
                  IconButton(
                      onPressed: () { Navigator.of(context).pop();},
                      icon: Icon(Icons.keyboard_arrow_down,
                      size: 30,
                      color: kPrimaryColor,
                  )),
            SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Place',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 118),
                  Text(
                      marker.title
                  )
                ]
            ),
            SizedBox(height: 10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Latitude',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 100),
                  Text(
                      marker.lat.toString()
                  )
                ]
            ),
            SizedBox(height: 10),
            Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text(
                    'Longitude',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                    SizedBox(width: 90),
                    Text(
                      marker.lon.toString()
                    )
                  ]
            ),
            SizedBox(height: 10),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 80),
                  Flexible(
                      child: Text(
                        marker.desc,
                      )
                  )
                ]
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => context.read<SavedLocations>().addLocation(marker),
              icon: const Icon(Icons.bookmark, size: 14),
              label: const Text('Save Location'),
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),

              ), )

          ]
        )
      );



}