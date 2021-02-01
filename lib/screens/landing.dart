import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth.dart';
import 'package:flutter_application_1/screens/home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggined = false;
    return isLoggined ? HomePage() : AuthorizationPage();
  }
}
