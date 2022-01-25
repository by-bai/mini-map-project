import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jtc_mini_project/models/location_model.dart';
import 'package:jtc_mini_project/providers/map_provider.dart';
import 'package:jtc_mini_project/providers/saved_locations_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
import 'services/auth_service.dart';
import 'wrapper.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await dotenv.load(fileName: ".env");
  
  await Firebase.initializeApp();
  
  await Hive.initFlutter();
  Hive.registerAdapter(LocationAdapter());
  await Hive.openBox<Location>('savedlocations');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

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

  @override
  void dispose() {
    Hive.box('savedlocations').close();

    super.dispose();
  }
}