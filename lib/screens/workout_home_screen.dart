import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/screens/playlist_screen.dart';
import 'package:shape_shifter_fitness_application/screens/profile_screen.dart';

import '../providers/read_user_data.dart';
import '../widgets/contact_instructor_widget.dart';
import '../widgets/greet_user_widget.dart';
import '../widgets/other_activity_options_widget.dart';
import '../widgets/resume_workout_options_widget.dart';
import '../widgets/show_calories_burnt_widget.dart';


class WorkoutHomeScreen extends StatefulWidget {
  static const routeName = "/WorkoutScreen";

  const WorkoutHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WorkoutHomeScreenState();
  }
}

class WorkoutHomeScreenState extends State<WorkoutHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black26,
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
        backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                icon: const Icon(
                  Icons.queue_music,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  goToNewPage(context);
                },
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () async {
                    await Provider.of<ReadUserData>(context,listen: false).readUser();
                    Navigator.of(context).pushNamed(UserProfileScreen.namedRoute);
                  },
                ),
              ),
            ]

        ),
        body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              children: const [
                GreetUser(),
                ResumeWorkoutOption(),
                ShowBurntCalories(),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20, right: 75),
                  child: Text("Engage in Other Activities?",style: TextStyle(fontFamily: "HeadingFont", fontSize: 24,),),
                ),
                OtherActivityOptions(),
                ContactInstructorOptions(),
              ],
            ),
          );
        },

      ),

    );
  }

  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(PlaylistScreen.routeName);
  }


}