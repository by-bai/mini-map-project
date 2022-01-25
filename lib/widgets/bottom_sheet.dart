import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:jtc_mini_project/providers/saved_locations_provider.dart';
import 'package:provider/src/provider.dart';
import '../boxes.dart';
import '../constants.dart';
import '../utils/location_helper.dart';

class MapBottomSheet extends StatefulWidget {
  final Location marker;

  const MapBottomSheet({
    Key? key,
    required this.marker
  }) : super(key: key);

  @override
  _MapBottomSheetState createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {

  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {

    //context.read<SavedLocations>().checkLocationExists(widget.marker)
    checkLocationExists(widget.marker)
        ?
          setState(() {
            _isButtonDisabled = true; })
        :
          setState(() {
            _isButtonDisabled = false;});

    return Container(
        padding: const EdgeInsets.only(
            left: 16, right: 16, top: 10, bottom: 30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
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
                        widget.marker.title
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
                        widget.marker.lat.toString()
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
                        widget.marker.lon.toString()
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
                          widget.marker.desc,
                        )
                    )
                  ]
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _isButtonDisabled ? null : _saveLocation();
                },
                icon: const Icon(Icons.bookmark, size: 14),
                label: const Text('Save Location'),
                style: ElevatedButton.styleFrom(
                  primary: _isButtonDisabled ? Color(0xffB8C8DD) : kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),

                ),)

            ]
        )
    );
  }

    void _saveLocation() {
      //context.read<SavedLocations>().addLocation(widget.marker);
      final box = Boxes.getSavedLocations();
      box.add(widget.marker);
      String text = '${widget.marker.title} added to your saved locations.';
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    }
}