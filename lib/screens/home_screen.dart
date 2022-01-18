import 'package:flutter/material.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/services/location_api.dart';
import '/widgets/widgets.dart';
import 'package:jtc_mini_project/models/location_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
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
                return FirstMap(locations: locations!);
              }
          }
        },
      ),
    );
  }
}

