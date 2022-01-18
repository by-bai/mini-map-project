import 'package:flutter/material.dart';
import 'package:jtc_mini_project/constants.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({Key? key}) : super(key: key);

  final List<Map> saved =
  [
    {
      "title": "NEX",
      "lat": 1.3510082678024458,
      "lon": 103.87226922618538,
      "desc": "Nex is a regional shopping mall in Serangoon.",
      "address": "23 Serangoon Central, Singapore 556083"
    },
    {
      "title": "Pasir Ris Central Hawker Centre",
      "lat": 1.3737921140483658,
      "lon": 103.95145003967957,
      "desc": "Homeground of traditional street food and hipster kitchens.",
      "address": "110 Pasir Ris Central, Singapore 519641"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Locations'),
          backgroundColor: kPrimaryColor,
        ),
        body: buildCards()
    );
  }

  buildCards()  => ListView.builder(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
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
                            Text(location['title'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor)),
                            const SizedBox(height: 12),
                            Text(location['address']),
                            const SizedBox(height: 12),
                          ]
                      ),
                      const Spacer(),
                      const Icon(Icons.bookmark, color: kPrimaryColor)
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

