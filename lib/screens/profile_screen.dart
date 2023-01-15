import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/user_profile_widget.dart';

class UserProfileScreen extends StatelessWidget {
  static const namedRoute = "/UserProfileScreen";

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 20.sp),
      ),
      body: const UserProfile(),
    );
  }
}
