import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({Key? key}) : super(key: key);

  final List<Map> saved =
  [
    {
      "title": "JTC Summit",
      "lat": 1.331340469992664,
      "lon": 103.74185756986775,
      "desc": "JTC Summit is a commercial building."
    },
    {
      "title": "JCube",
      "lat": 1.3335359655075774,
      "lon": 103.74020443847188,
      "desc": "JCube offers a good variety of shopping, F&B & entertainment options."
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Locations'),
          backgroundColor: const Color(0xff0E4DA4),
        ),
        body: buildCards()
    );
  }

  buildCards()  => ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: saved.length,
    itemBuilder: (context, index) {
      final location = saved[index];

      return ListTile(
        title: Text(location['title']),
        subtitle: Text(location['desc']),
      );
    },
  );
}

