import 'package:flutter/material.dart';
import '../domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar:
            AppBar(title: Text('MaxFit'), leading: Icon(Icons.fitness_center)),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  // const WorkoutsList({Key key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
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
                                right: BorderSide(
                                    width: 1, color: Colors.white24))),
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
      ),
    );
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
