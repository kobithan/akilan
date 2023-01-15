import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/providers/read_user_data.dart';


class GreetUser extends StatefulWidget {
  const GreetUser({Key? key}) : super(key: key);

  @override
  _GreetUserState createState() => _GreetUserState();
}

class _GreetUserState extends State<GreetUser> {
  @override
  Widget build(BuildContext context) {
    final user  = Provider.of<ReadUserData>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 30, right: 30, bottom: 20),
      child: Column(
        children: <Widget>[
          Column(
            children:  [
              Text("Hello ${user.firstName}!", style: TextStyle(fontFamily: "HeadingFont", fontSize: 28, color: Colors.indigo,fontWeight: FontWeight.w700 ),),
              Text("Continue Your Last Progress?", style: TextStyle(fontFamily: "HeadingFont", fontSize: 22),)
            ],
          ),
        ],
      ),
    );
  }
}
