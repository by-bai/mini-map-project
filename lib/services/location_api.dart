import 'dart:convert';

import 'package:jtc_mini_project/models/location_model.dart';
import 'package:flutter/material.dart';

class LocationApi {
  static Future<List<Location>> getLocationsLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/data/locations.json');
    final body = json.decode(data);

    return body.map<Location>(Location.fromJson).toList();
  }
}