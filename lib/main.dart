import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jtc_mini_project/providers/map_provider.dart';
import 'package:jtc_mini_project/providers/saved_locations_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'services/auth_service.dart';
import 'wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(create: (_) => SavedLocations()),
        ChangeNotifierProvider(create: (_) => MapProvider())
      ],
      child: MaterialApp(
        title: 'Mini Map Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/login': (context) => LoginScreen(),
          '/saved': (context) => SavedScreen(),
          '/weather': (context) => WeatherScreen()
        },
      ),
    );
  }
}