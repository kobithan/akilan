import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/instructors.dart';
import '../modules/instructor.dart';

class InstructorList extends StatefulWidget {
  const InstructorList({Key? key}) : super(key: key);

  @override
  _InstructorListState createState() => _InstructorListState();
}

class _InstructorListState extends State<InstructorList> {
  List<Instructor> instructors = allInstructors;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: instructors.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            child: Material(
              color: Colors.white70,
              elevation: 10,
              borderRadius: BorderRadius.circular(18),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                splashColor: Colors.black26,
                  onTap: () async{
                    final Uri contactNum = Uri.parse("tel:"+instructors[index].tel);
                    if (!await launchUrl(contactNum)) throw 'Could not launch $contactNum';
                  },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Ink.image(
                        image: NetworkImage(instructors[index].urlImage),
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: instructors[index].instructorName +'\n',
                        style: const TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                              text: instructors[index].instructorInfo +'\n',
                              style: const TextStyle(color: Colors.black54, fontSize: 10.0 )
                          ),
                          TextSpan(
                              text: 'Email : '+instructors[index].email +'\n',
                              style: const TextStyle(color: Colors.black54, fontSize: 10.0 )
                          ),
                          TextSpan(
                              text: 'Tap to Call : '+instructors[index].tel+'\n',
                              style: const TextStyle(color: Colors.black, fontSize: 15.0 ,fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    )
                  ],
                ),


              ),
            ),

          );
        },

      ),
    );
  }
}
