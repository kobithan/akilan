import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/other_activities.dart';
import '../modules/other_activity.dart';
import '../screens/other_activity_screen.dart';

class OtherActivityOptions extends StatefulWidget {
  const OtherActivityOptions({Key? key}) : super(key: key);

  @override
  _OtherActivityOptionsState createState() => _OtherActivityOptionsState();
}

class _OtherActivityOptionsState extends State<OtherActivityOptions> {
  List<OtherActivity> otherActivities = allActivities;
  var selectedActivity=0;

  @override
  Widget build(BuildContext context){
    return Container(
      width: 700,
      height: 170,
      padding: const EdgeInsets.only(left: 10, bottom: 20.0),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.transparent,
      ),
      child: ListView.builder(
        itemCount: otherActivities.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final activity = otherActivities[index];
          return buildActivity(activity,index);
        },

      ),
    );
  }
  Widget buildActivity(OtherActivity otherActivities,int index) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Material(
          color: Colors.blue.shade800,
          elevation: 10,
          borderRadius: BorderRadius.circular(18),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.black26,
            onTap: (){
              _sendDataToSecondScreen(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                //border: Border.all(color: Colors.indigoAccent.shade100,width: 4),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Ink.image(
                  image: NetworkImage(otherActivities.urlImage),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                child: Center(
                  child: Text(
                    otherActivities.activityName,
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  ),
                ),
                ),
            ),
          ),
        ),

      );
  void _sendDataToSecondScreen(BuildContext context,int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtherActivityScreen(index: index),
        ));
  }
}
