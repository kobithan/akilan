import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../data/other_activities.dart';
import '../modules/other_activity.dart';
import '../widgets/timePicker.dart';

class OtherActivityScreen extends StatelessWidget {
  OtherActivityScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  List<OtherActivity> otherActivities = allActivities;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.black26,
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
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
        body:
        InkWell(
          child: Ink.image(
            image: NetworkImage(otherActivities[index].urlImage),
            fit: BoxFit.cover,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          otherActivities[index].activityName,
                        style: const TextStyle(
                            fontFamily: "HeadingFont",
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        ),
                        Text(
                          otherActivities[index].activityDescription,
                          style: TextStyle(fontSize: 18,color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22),
                          child: Text(
                            "Enter the amount of time you spent on "+otherActivities[index].activityName,
                            style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700),
                          ),
                        ),
                        const TimePicker(),
                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
        ),
    );

  }
}




