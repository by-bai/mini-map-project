import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/providers/map_provider.dart';
import 'package:provider/provider.dart';
import '/services/auth_service.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer({Key? key, required this.controller, required this.animateCamera}) : super(key: key);
  Completer<GoogleMapController> controller;
  Function(LatLng, double) animateCamera;

  @override
  State<NavigationDrawer> createState() => NavigationDrawerState();
}

class NavigationDrawerState extends State<NavigationDrawer> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  final color = kPrimaryColor;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final mapService = Provider.of<MapProvider>(context);

    final name = 'Bai He';
    final email = 'bh@gmail.com';
    final imageUrl = 'https://images.unsplash.com/uploads/14110635637836178f553/dcc2ccd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80';
    return Drawer(
      child: Material(
        color: color,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: imageUrl,
              name: name,
              email: email,
              ),
            Container(
            padding: padding,
            child: Column(
              children: [
                buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () {
                      Navigator.of(context).pop(); // close navigation drawer
                      String? currentRoute = ModalRoute.of(context)?.settings.name;
                      if (currentRoute != '/') {
                        Navigator.pushNamed(context, '/');
                      }
                    }
                ),
                buildMenuItem(
                    text: 'Saved',
                    icon: Icons.bookmark,
                    onClicked: () async {
                      Navigator.of(context).pop(); // close navigation drawer
                      await Navigator.pushNamed(context, '/saved');
                      if (mapService.runAnimateCamera) {
                        widget.animateCamera(mapService.cameraPosition, mapService.cameraZoom);
                        mapService.updateRunAnimateCamera();
                      }
                    },
                ),
                buildMenuItem(
                    text: 'Temp',
                    icon: Icons.map_outlined,
                    onClicked: () {
                      Navigator.of(context).pop(); // close navigation drawer
                      Navigator.pushNamed(context, '/temp'); }
                ),
                buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () async {
                      await authService.signOut();
                      // pop all screens stacked on top of first screen(Home) in stack
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    }
                )
            ]
           )
          )
         ]
        )
      )
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,

}) {

    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: onClicked,
      tileColor: color
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

}