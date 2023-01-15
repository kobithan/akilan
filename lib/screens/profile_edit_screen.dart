import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/edit_profile.dart';

class ProfileEditScreen extends StatelessWidget {
  static const routeName = "/EditProfileScreen";

  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
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
      body: const EditProfile(),
    );
  }
}
