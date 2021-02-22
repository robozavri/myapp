import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/landing.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

import 'domain/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        title: 'Max fitnes',
        theme: ThemeData(
            primaryColor: Colors.blueGrey[700],
            textTheme: TextTheme(headline3: TextStyle(color: Colors.white))),
        home: LandingPage(),
      ),
    );
  }
}
