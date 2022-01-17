import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class MapDialog extends StatelessWidget {
  final Location marker;
  MapDialog({required this.marker});

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

  _buildChild(BuildContext context) => Container(
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Spacer(),
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close_rounded, size: 18),
                label: Text("CLOSE"),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // remove default padding
                  primary: const Color(0xff0E4DA4)
                )
              )
            ]
          ),
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
          SizedBox(height: 10),
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

        ]
      )
  );

}

