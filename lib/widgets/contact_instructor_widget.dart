import 'package:flutter/material.dart';

import '../screens/contact_instructor_screen.dart';

class ContactInstructorOptions extends StatefulWidget {
  const ContactInstructorOptions({Key? key}) : super(key: key);

  @override
  _ContactInstructorOptionsState createState() => _ContactInstructorOptionsState();
}

class _ContactInstructorOptionsState extends State<ContactInstructorOptions> {
  @override
  Widget build(BuildContext){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10,  bottom: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.shade800,
              onPrimary: Colors.white,
              shadowColor: Colors.black,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: const Size(200, 50), //////// HERE
            ),
            onPressed: () {
              goToNewPage(context);
            },
            child: const Text('Contact Instructor?', textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( bottom: 20, left: 10),
          child: IconButton(
            icon: const Icon(
              Icons.call,
              color: Colors.indigo,
              size: 42,
            ),
            onPressed: () {
              goToNewPage(context);
            },
          ),
        ),
      ],
    );
  }
  void goToNewPage(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ContactInstructorScreen.routeName);
  }
}
