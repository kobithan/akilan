import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../widgets/authentication_inputs.dart';
import '../widgets/rounded_buttons.dart';
import '../providers/authentication_validation.dart';
import '../providers/reset_password_service.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool _isLoading = Provider.of<ResetPasswordService>(context).isLoading;
    final _authenticationValidation = Provider.of<AuthenticationValidation>(context);
    final _isErrorEmail = _authenticationValidation.isEmailError;
    final _errorTextMessageEmail = _authenticationValidation.errorMessageEmail;

    Widget _errorMessage(String text) {
      return SizedBox(
          width: 75.w,
          child: _isErrorEmail
              ? Text(
                  text,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                )
              : null);
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          children: [
            Text(
              "Forgot Your Password?",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Lottie.asset('assets/resetPassword.json'),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              "Don't Worry Our Team Got You Covered",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 90.w,
              padding: EdgeInsets.only(
                top: 2.h,
                left: 1.h,
                right: 1.h,
                bottom: 2.h,
              ),
              child: Text(
                "Enter You Email Attached To Your ShapeShifter Profile To Receive An Email To Reset Your Password",
                style: TextStyle(
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FormFields(
              "shapeshifterfitness@gmail.com",
              Icons.person,
              Colors.deepPurple,
              Colors.deepPurple.withOpacity(0.3),
              _emailController,
              false,
              TextInputAction.done,
              () {},
              TextInputType.emailAddress,
              false,
              _isErrorEmail,
              _emailFocusNode,
              () {},
            ),
            _errorMessage(_errorTextMessageEmail),
            SizedBox(
              height: 1.5.h,
            ),
            _isLoading
                ? Padding(
                    padding: EdgeInsets.all(1.h),
                    child: const CupertinoActivityIndicator(radius: 10))
                : RoundedButton(
                    "Reset Password",
                    Colors.deepPurple,
                    () {
                      Provider.of<AuthenticationValidation>(context, listen: false).emailValidation(context, _emailController.text.trim(),);
                    },
                    18.w,
                    Colors.white,
                    4.w,
                  ),
            SizedBox(
              height: 2.h,
            ),
            Text("Shape Shifter Fitness (SriLanka) Limited.", style: TextStyle(fontSize: 10.sp),),
          ],
        ),
      ),
    );
  }
}
