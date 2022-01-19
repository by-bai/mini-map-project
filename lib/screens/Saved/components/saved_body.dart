import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:jtc_mini_project/providers/saved_locations_provider.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class SavedBody extends StatefulWidget {
  const SavedBody({
    Key? key,
  }) : super(key: key);

  @override
  _SavedBodyState createState() => _SavedBodyState();
}

class _SavedBodyState extends State<SavedBody> {

  int _indexOfElement = 0;
  List<Location> _savedLocations = [];

  @override
  Widget build(BuildContext context) {
    _savedLocations = context
        .watch<SavedLocations>()
        .savedLocations;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      itemCount: _savedLocations.length,
      itemBuilder: (context, index) {
        final location = _savedLocations[index];

        return Container (
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
                      Row(
                          children:
                          [
                            TextButton.icon(
                                onPressed: () => {},
                                icon: const Icon(Icons.map_outlined, size: 18),
                                label: const Text("View on Map"),
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero, // remove default padding
                                    primary: kPrimaryColor
                                )
                            ),
                            const SizedBox(width: 12),
                            TextButton.icon(
                                onPressed: () => removeLocation(location),
                                icon: const Icon(Icons.delete, size: 18),
                                label: const Text("Remove Location"),
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero, // remove default padding
                                    primary: kPrimaryColor
                                )
                            )
                          ]
                      )
                    ],
                  ))));
      },
    );
  }

  void removeLocation(Location location) {
      setState(() {
        _indexOfElement = _savedLocations.indexOf(location);
      });
      context.read<SavedLocations>().removeLocation(location);
      String text = '${location.title} removed from your saved locations.';
      final snackBar = SnackBar(
          content: Text(text),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () => context.read<SavedLocations>().addLocationAtIndex(location, _indexOfElement),
          )
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}