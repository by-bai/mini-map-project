import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:jtc_mini_project/services/location_api.dart';

import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    Future<void> _goToLocation(LatLng cameraPosition, double cameraZoom) async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: cameraPosition, zoom: cameraZoom)));
    }

    return Scaffold(
      drawer: NavigationDrawer(
          controller: _controller, animateCamera: _goToLocation),
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: kPrimaryColor,
      ),
      body: FutureBuilder<List<Location>>(
        future: LocationApi.getLocationsLocally(context),
        builder: (context, snapshot) {
          final locations = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Some error occurred!'));
              } else {
                return FirstMap(
                  locations: locations!,
                  controller: _controller,
                  animateCamera: _goToLocation,
                );
              }
          }
        },
      ),
    );
  }
}
