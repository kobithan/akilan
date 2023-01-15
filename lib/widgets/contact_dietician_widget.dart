import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/contact_dietician_screen.dart';

class ContactDieticianOptions extends StatefulWidget {
  const ContactDieticianOptions({Key? key}) : super(key: key);

  @override
  _ContactDieticianOptionsState createState() => _ContactDieticianOptionsState();
}

class _ContactDieticianOptionsState extends State<ContactDieticianOptions> {
  @override
  Widget build(BuildContext){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10,  bottom: 20, right: 10),
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
            child: const Text('Contact Dietician ?', textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only( bottom: 20, left: 5),
          child: IconButton(
            icon: const Icon(
              Icons.call,
              color: Colors.indigo,
              size: 40,
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
    Navigator.of(ctx).pushNamed(ContactDieticianScreen.routeName);
  }
}
