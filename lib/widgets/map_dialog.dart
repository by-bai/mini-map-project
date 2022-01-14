import 'package:flutter/material.dart';

class MapDialog extends StatelessWidget {
  final Map marker;
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
    height: 150,
    child: Column(
      children: <Widget>[
        TextButton(
          child: Text('close icon'),
          onPressed: () {
            Navigator.of(context).pop(); //dismiss popup
          },
        ),
        Text(
          marker['title']
        ),
        Text(
          marker['lat'].toString()
        ),
        Text(
          marker['lon'].toString()
        ),
        Text(
          marker['desc']
        )
      ]
    )
  );

}

