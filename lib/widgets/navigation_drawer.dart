import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/services/auth_service.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Drawer(
      child: Material(
        color: const Color(0xff0E4DA4),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
                text: 'Second Map',
                icon: Icons.map_outlined,
                onClicked: () => Navigator.pushNamed(context, '/temp')

            ),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () async {
                  await authService.signOut();
                  // pop all screens stacked on top of first screen(Home) in stack
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }
            ),
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
    final color = const Color(0xff0E4DA4);

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
      tileColor: Colors.white,
    );
  }

}