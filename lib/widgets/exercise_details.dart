import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseDetails extends StatefulWidget {
  const ExerciseDetails({Key? key}) : super(key: key);

  @override
  _ExerciseDetailsState createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.08,
      maxChildSize: 0.8,
      builder: (context,scrollController)=>
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: const [
                Text("How to do -Exercise Name-", style: TextStyle(fontFamily: "HeadingFont", fontSize: 12),),
                Text("Explain how to perform the exercise with correct posture, what not to do etc. Explain how to perform the exercise with correct posture, what not to do etc.", style: TextStyle(fontFamily: "HeadingFont", fontSize: 8),),
              ],
            ),
          ),
    );
  }
}
