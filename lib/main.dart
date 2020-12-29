import 'package:firebase_core/firebase_core.dart';
import 'package:fix_app/LogIn.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'SignUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SignUp(),
        '/login': (context) => LogIn(),
        '/home': (context) => Home(),
      },
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
    );
  }
}