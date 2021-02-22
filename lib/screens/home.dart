import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/active-workouts.dart';
import 'package:flutter_application_1/components/workout-list.dart';
import 'package:flutter_application_1/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int secionIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget navigationBar = CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.fitness_center),
        Icon(Icons.search),
      ],
      index: 0,
      height: 50,
      color: Colors.white.withOpacity(0.5),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (int index) {
        setState(() => secionIndex = index);
      },
    );
    return Container(
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text('MaxFit //' +
                (secionIndex == 0 ? 'Active workouts' : 'Find workouts')),
            leading: Icon(Icons.fitness_center),
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () => {AuthService().logOut()},
                  icon: Icon(Icons.supervised_user_circle, color: Colors.white),
                  label: SizedBox.shrink())
            ],
          ),
          body: secionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
          bottomNavigationBar: navigationBar),
    );
  }
}
