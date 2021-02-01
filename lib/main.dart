import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Max fitnes',
      theme: ThemeData(
          primaryColor: Colors.blueGrey[700],
          textTheme: TextTheme(headline3: TextStyle(color: Colors.white))),
      home: LandingPage(),
    );
  }
}
