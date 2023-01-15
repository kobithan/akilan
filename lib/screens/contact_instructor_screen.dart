import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/workout_home_screen.dart';

import '../widgets/instructor_list.dart';

class ContactInstructorScreen extends StatefulWidget {
  static const routeName = "/ContactInstructorScreen";

  const ContactInstructorScreen({Key? key}) : super(key: key);

  @override
  _ContactInstructorScreenState createState() => _ContactInstructorScreenState();
}

class _ContactInstructorScreenState extends State<ContactInstructorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
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


        ),

        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.shade800,
                    Colors.blueGrey.shade50,
                  ],
                )
            ),
            child: const InstructorList(),

          ),
        ),

      );
  }

  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(WorkoutHomeScreen.routeName);
  }
}
