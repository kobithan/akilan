import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/exercises.dart';
import '../modules/Exercise.dart';

class WorkoutControls extends StatefulWidget {
  final Exercise currentExercise;
  const WorkoutControls({Key? key,required this.currentExercise}) : super(key: key);

  @override
  _WorkoutControlsState createState() => _WorkoutControlsState();
}

class _WorkoutControlsState extends State<WorkoutControls>  with TickerProviderStateMixin{

  List<Exercise> exercises = exercises1;
  int index = 0;
  Exercise currentExercise = exercises1.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Image.network(currentExercise.urlVideo),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: previous,
                //child: Icon (Icons.pause_presentation,size: 30,color: Colors.blueAccent[100],),
                child: Icon (Icons.undo,size: 30,color: Colors.blueAccent[100],),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(
                        title: '   Sets   ',
                        //value: '${exercise.numOfSets} sets',
                        value: '10',
                      ),
                      buildText(
                        title: '   Reps   ',
                        value: '20',
                      ),
                    ],
                  ),
                ],
              ),
              /*Column(
                children: [
                  CircularProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  Text("00:00", style: TextStyle(fontFamily: "HeadingFont", fontSize: 15),),
                ],
              ),*/
              ElevatedButton(
                onPressed: next,
                //child: Icon (Icons.keyboard_tab,size: 30,color: Colors.blueAccent[100],),
                child: Icon (Icons.redo,size: 30,color: Colors.blueAccent[100],),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void next() {
    if (index<exercises.length){
      index++;
      currentExercise = exercises[index];
    }
    print(index);
  }

  void previous() {
    if (index>0){
      index--;
      currentExercise = exercises[index];
    }
    print(index);
  }


      Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey,fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
}
