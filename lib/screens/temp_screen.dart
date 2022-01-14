import 'package:flutter/material.dart';
import '/widgets/widgets.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Map'),
          backgroundColor: const Color(0xff0E4DA4),
        ),
        body: SecondMap()
    );
  }
}

