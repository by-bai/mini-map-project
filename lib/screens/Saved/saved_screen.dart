import 'package:flutter/material.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/screens/Saved/components/saved_body.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Saved Locations'),
          backgroundColor: kPrimaryColor,
        ),
        body: const SavedBody()
    );
  }
}

