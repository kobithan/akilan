import 'package:flutter/material.dart';

import '../screens/working_out_screen.dart';


class ResumeWorkoutOption extends StatefulWidget {
  const ResumeWorkoutOption({Key? key}) : super(key: key);

  @override
  _ResumeWorkoutOptionState createState() => _ResumeWorkoutOptionState();
}

class _ResumeWorkoutOptionState extends State<ResumeWorkoutOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 350,
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage('https://media.istockphoto.com/photos/handsome-muscular-man-in-a-tshirt-and-shorts-doing-functional-on-at-picture-id1151003764?k=20&m=1151003764&s=612x612&w=0&h=04vb_IduCspx8cNlC2r3B2WXANRKC6tqPdeZuihD92M='),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      shape: BoxShape.rectangle
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue.shade800,
                            onPrimary: Colors.white,
                            shadowColor: Colors.black,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onPressed: () {
                            goToNewPage(context);
                          },
                          child: const Text('START WORKOUT', textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },),
    );
  }
  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(WorkingOutScreen.routeName);
  }
}
