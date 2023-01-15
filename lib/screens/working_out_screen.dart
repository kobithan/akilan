import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/calorie_progress.dart';
import 'package:shape_shifter_fitness_application/providers/upload_user_data.dart';
import 'package:shape_shifter_fitness_application/screens/finished_workout_screen.dart';

import '../data/exercises.dart';
import '../modules/Exercise.dart';
import '../providers/read_user_data.dart';


class WorkingOutScreen extends StatefulWidget {
  static const routeName = "/WorkingOutScreen";
  List<Exercise> exercises = ectormorphExercises;

  WorkingOutScreen({Key? key}) : super(key: key);

  @override
  _WorkingOutScreenState createState() => _WorkingOutScreenState();
}

class _WorkingOutScreenState extends State<WorkingOutScreen> {

  double totalCalsBurned = 0;
  int index = 0;
  late Exercise currentExercise;
  final controller = PageController();

  late final List<Exercise> currentList;
  @override
  void initState() {
    final String listName = Provider.of<ReadUserData>(context, listen: false).modelName!;
    super.initState();
    if(listName=="Mesomorph Male" || listName=="Mesomorph Female"){
      currentList=mesormorphExercises;
      widget.exercises= mesormorphExercises;
      currentExercise = widget.exercises.first;
      totalCalsBurned = currentList[index].caloriesBurned;
    }
    else if(listName=="Ectomorph Male" || listName=="Ectomorph Female"){
      currentList=ectormorphExercises;
      widget.exercises= ectormorphExercises;
      currentExercise = widget.exercises.first;
      totalCalsBurned = currentList[index].caloriesBurned;
    }
    else{
      currentList=endormorphExercises;
      widget.exercises= endormorphExercises;
      currentExercise = widget.exercises.first;
      totalCalsBurned = currentList[index].caloriesBurned;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(currentExercise.exerciseName),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: PageView.builder(
              itemCount: mesormorphExercises.length,
              controller: controller,
              itemBuilder: (BuildContext context, int itemIndex) {
                return SizedBox(
                  child: Image.asset(currentExercise.urlVideo),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: previous,
                  //child: Icon (Icons.pause_presentation,size: 30,color: Colors.blueAccent[100],),
                  child: Icon(
                    Icons.undo,
                    size: 30,
                    color: Colors.blueAccent[100],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildText(
                          title: '   Sets   ',
                          value: '${currentList[index].sets}',
                        ),
                        buildText(
                          title: '   Reps   ',
                          value: '${currentList[index].reps}',
                        ),
                      ],
                    ),
                  ],
                ),
                index < currentList.length - 1
                    ? ElevatedButton(
                        onPressed: () {
                          index++;
                          totalCalsBurned+=currentList[index].caloriesBurned;
                          print(totalCalsBurned);
                          currentExercise = currentList[index];
                          setState(() {
                            controller.jumpToPage(index);
                          });
                        },
                        child: Icon(
                          Icons.redo,
                          size: 30,
                          color: Colors.blueAccent[100],
                        ))
                    : ElevatedButton(
                        onPressed: () async {
                          final calMeter = Provider.of<CalorieProgress>(context, listen: false);
                          calMeter.leftAmount = calMeter.leftAmount - totalCalsBurned;
                          calMeter.progress = calMeter.progress + totalCalsBurned;
                          await Provider.of<UploadUserData>(context, listen: false).uploadAppData(context);
                          Navigator.of(context)
                              .pushReplacementNamed(FinishedWorkoutScreen.routeName);
                        },
                        child: Text("Finished")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void previous() {
    if (index > 0) {
      index--;
      currentExercise = currentList[index];
      setState(() {
        controller.jumpToPage(index);
      });
    }
  }

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );
}
