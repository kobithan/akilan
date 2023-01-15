import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../widgets/user_survey.dart';

class UserSurveyScreen extends StatelessWidget {

  static const routeName = '/UserSurveyScreen';

  const UserSurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 20.sp),
      ),
      body: const UserSurvey(),
    );
  }
}
