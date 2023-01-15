import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/reset_password.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = "/resetPasswordScreen";

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black, size: 20.sp),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: const ResetPasswordWidget()),
    );
  }
}
