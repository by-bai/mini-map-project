import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_model.dart';
import 'screens/screens.dart';
import 'services/auth_service.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserObject?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<UserObject?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final UserObject? user = snapshot.data;
          return user == null ? LoginScreen() : const HomeScreen();
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
