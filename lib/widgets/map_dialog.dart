import 'package:flutter/material.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class MapDialog extends StatelessWidget {
  final Location marker;
  const MapDialog({required this.marker});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: _buildChild(context),
    );
  }

  Container _buildChild(BuildContext context) => Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              const Spacer(),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_rounded, size: 18),
                label: const Text("CLOSE"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // remove default padding
                  primary: kPrimaryColor
                )
              )
            ]
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'Place',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 118),
              Text(
                marker.title
              )
            ]
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Latitude',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    marker.lat.toString()
                )
              ]
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Longitude',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  marker.lon.toString()
                )
              ]
          ),
          const SizedBox(height: 10),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 80),
                Flexible(
                    child: Text(
                        marker.desc,
                    )
                )
              ]
          ),

        ]
      )
  );

}

