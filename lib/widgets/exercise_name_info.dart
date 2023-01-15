import 'package:flutter/cupertino.dart';

class ExerciseNameInfo extends StatefulWidget {
  const ExerciseNameInfo({Key? key}) : super(key: key);

  @override
  _ExerciseNameInfoState createState() => _ExerciseNameInfoState();
}

class _ExerciseNameInfoState extends State<ExerciseNameInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
      child: Center(
        child: Column(
          children: const [
            Text("Exercise Name", style: TextStyle(fontFamily: "HeadingFont", fontSize: 20),),
            Text("Set amount", style: TextStyle(fontFamily: "HeadingFont", fontSize: 15),),
            Text("No. of sets", style: TextStyle(fontFamily: "HeadingFont", fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
