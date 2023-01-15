import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shape_shifter_fitness_application/screens/demo_main_screen.dart';
import 'package:shape_shifter_fitness_application/screens/navigation_screen.dart';
import 'package:sizer/sizer.dart';

import '../widgets/select_body_type.dart';

class SelectBodyTypeScreen extends StatelessWidget {
  static const routeName = "/SelectBodyTypeScreen";

  const SelectBodyTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    return _isVerified ? const DemoMainScreen() : Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Your Body Type',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20.sp,
        ),
      ),
      body: const SelectBodyType(),
    );
  }
}
