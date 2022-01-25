import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:jtc_mini_project/providers/map_provider.dart';
import 'package:provider/provider.dart';

import '../../../boxes.dart';
import '../../../constants.dart';

class SavedBody extends StatefulWidget {
  const SavedBody({
    Key? key,
  }) : super(key: key);

  @override
  _SavedBodyState createState() => _SavedBodyState();
}

class _SavedBodyState extends State<SavedBody> {
  //int _indexOfElement = 0;
  List<Location> _savedLocations = [];

  @override
  Widget build(BuildContext context) {
    // _savedLocations = context
    //     .watch<SavedLocations>()
    //     .savedLocations;

    return ValueListenableBuilder<Box<Location>>(
        valueListenable: Boxes.getSavedLocations().listenable(),
        builder: (context, box, _) {
          _savedLocations = box.values.toList().cast<Location>();

          if (_savedLocations.isEmpty) {
            return const Center(child: Text('No saved locations yet!'));
          }

          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(24),
              itemCount: _savedLocations.length,
              itemBuilder: (context, index) {
                final location = _savedLocations[index];

                return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Text(location.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                const SizedBox(height: 12),
                                Text(location.address),
                                const SizedBox(height: 12),
                                Row(children: [
                                  TextButton.icon(
                                      onPressed: () => goToMap(location),
                                      icon: const Icon(Icons.map_outlined,
                                          size: 18),
                                      label: const Text("View on Map"),
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          // remove default padding
                                          primary: kPrimaryColor)),
                                  const SizedBox(width: 12),
                                  TextButton.icon(
                                      onPressed: () => removeLocation(location),
                                      icon: const Icon(Icons.delete, size: 18),
                                      label: const Text("Remove Location"),
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          // remove default padding
                                          primary: kPrimaryColor))
                                ])
                              ],
                            ))));
              });
        });
  }

  void removeLocation(Location location) {
    // setState(() {
    //   _indexOfElement = _savedLocations.indexOf(location);
    // });
    //context.read<SavedLocations>().removeLocation(location);
    final box = Boxes.getSavedLocations();
    int indexOfElement = _savedLocations.indexOf(location);
    box.deleteAt(indexOfElement);
    String text = '${location.title} removed from your saved locations.';
    final snackBar = SnackBar(
        content: Text(text),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () => box.add(
                location) //context.read<SavedLocations>().addLocationAtIndex(location, _indexOfElement),
            ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void goToMap(Location location) {
    context.read<MapProvider>().updatePosition(location.lat, location.lon);
    context.read<MapProvider>().updateZoom(16.0);
    context.read<MapProvider>().updateRunAnimateCamera();
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }
}
