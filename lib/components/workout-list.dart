import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/workout.dart';

class WorkoutsList extends StatefulWidget {
  // const WorkoutsList({Key key}) : super(key: key);

  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {
  final workouts = <Workout>[
    Workout(
        author: 'niko',
        title: 'პრესის ვარჯიში',
        description: 'test descr1',
        level: 'intermediate'),
    Workout(
        author: 'niko 2',
        title: 'პრესის ვარჯიში 2',
        description: 'test descr2',
        level: 'begginer'),
    Workout(
        author: 'niko 3',
        title: 'პრესის ვარჯიში 3',
        description: 'test descr3',
        level: 'advanced'),
  ];

  var filterOnluMyWorkouts = false;
  var filter = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';
  var filterText = '';
  var filterHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    var workoutsList = Container(
      child: ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, i) {
          return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[800]),
                child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.fitness_center,
                        color: Theme.of(context).textTheme.headline3.color,
                      ),
                      decoration: BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(width: 1, color: Colors.white24))),
                    ),
                    title: Text(
                      workouts[i].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline3.color),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).textTheme.headline3.color),
                    subtitle: subtitle(context, workouts[i])),
              ));
        },
      ),
    );
    return Column(children: <Widget>[
      // filterInfo,
      // filterForm,
      workoutsList
    ]);
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'begginer':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.headline3.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 3,
        child: Text(
          workout.level,
          style: TextStyle(color: Theme.of(context).textTheme.headline3.color),
        ),
      )
    ],
  );
}
