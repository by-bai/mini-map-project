import 'package:flutter/material.dart';
import 'package:jtc_mini_project/screens/Login/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFCFCFD),
      body: LoginBody(),
    );
  }
}
