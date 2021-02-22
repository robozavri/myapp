import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/user.dart';
import 'package:flutter_application_1/screens/auth.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggined = user != null;
    return isLoggined ? HomePage() : AuthorizationPage();
  }
}
