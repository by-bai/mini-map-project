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

  @override
  Widget build(BuildContext context) {
    List<Location> saved = context
        .watch<SavedLocations>()
        .savedLocations;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(24),
      itemCount: saved.length,
      itemBuilder: (context, index) {
        final location = saved[index];

        return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 22),
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [
                                Text(location.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor)),
                                const SizedBox(height: 12),
                                Text(location.address),
                                const SizedBox(height: 12),
                              ]
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () =>
                              {
                                context.read<SavedLocations>().removeLocation(location)
                              },
                              icon: Icon(Icons.bookmark),
                              color: kPrimaryColor
                          )
                        ]
                    ),
                    TextButton.icon(
                        onPressed: () => {},
                        icon: const Icon(Icons.map_outlined, size: 18),
                        label: const Text("View on Map"),
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // remove default padding
                            primary: kPrimaryColor
                        )
                    )
                  ],
                )));
      },
    );
  }
}