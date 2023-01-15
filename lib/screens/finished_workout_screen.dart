import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/navigation_screen.dart';


class FinishedWorkoutScreen extends StatefulWidget {
  static const routeName = "/FinishedWorkoutScreen";

  const FinishedWorkoutScreen({Key? key}) : super(key: key);

  @override
  _FinishedWorkoutScreenState createState() => _FinishedWorkoutScreenState();
}

class _FinishedWorkoutScreenState extends State<FinishedWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 25.sp,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(NavScreen.routeName);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 550,
              child: Image.asset('assets/workout_gifs/thumbsUp.gif'),
            ),
          Container(
            alignment: Alignment.center,
            child: const Text(
                    "Congradulations!!!\nYou have Finished Your Workout!!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "HeadingFont",
                        fontSize: 28,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}
