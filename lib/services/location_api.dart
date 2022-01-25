import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class LocationApi {
  static Future<List<Location>> getLocationsLocally(
      BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data/locations.json');
    final body = json.decode(data);

    List<Location> results =
        body.map<Location>(Location.fromJson).toList() as List<Location>;
    return results;
  }
}
