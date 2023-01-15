import 'package:flutter/cupertino.dart';

import '../data/exercises.dart';
import '../modules/Exercise.dart';

class ExerciseVideo extends StatefulWidget {
  List<Exercise> exercises = exercises1;

  ExerciseVideo({Key? key}) : super(key: key);

  @override
  _ExerciseVideoState createState() => _ExerciseVideoState();
}

class _ExerciseVideoState extends State<ExerciseVideo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.network(exercises1[2].urlVideo),
    );
  }
}
