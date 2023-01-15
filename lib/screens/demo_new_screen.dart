import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class DemoNewScreen extends StatelessWidget {
  //This is the route name for your pages, for every new page you create create a static const variable with same name and change value to your newly created page ue the same format first add "/" then add your screen name no spaces.
  static const routeName = "/demoNewScreen";

  const DemoNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("THIS IS THE NEW SCREEN"),
      ),
      body: Center(
        child: Text(
          "THIS IS THE NEW SCREEN",
          style: TextStyle(
            fontSize: 50.sp,//THIS IS HOW YOU SET FONT SIZE USING SIZER
          ),
        ),
      ), // THIS IS HOW YOU CALL A WIDGET FROM WIDGETS FOLDER
    );
  }
}
