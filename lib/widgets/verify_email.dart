import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../widgets/rounded_buttons.dart';
import '../providers/user_form_control.dart';

class VerifyEmailContent extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final _email;
  final bool _canResendEmail;
  final Function _sendVerificationEmail;

  const VerifyEmailContent(
      this._email, this._canResendEmail, this._sendVerificationEmail,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Verify Your Email Address",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Lottie.asset('assets/email.json'),
        Padding(
          padding: EdgeInsets.only(left: 1.h, right: 1.h, bottom: 2.h),
          child: Text(
            _email!,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 90.w,
          padding: EdgeInsets.only(
            top: 1.h,
            left: 1.h,
            right: 1.h,
            bottom: 3.h,
          ),
          child: Text(
            "Thank You For Joining With Shape Shifter Fitness (SriLanka) Limited. A Verification Email Has Been Sent To Your Email. Click The Link Attached In The Email To Verify It's You",
            style: TextStyle(
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _canResendEmail ? RoundedButton(
          "Resend Email",
          _canResendEmail
              ? Colors.deepPurple
              : Colors.deepPurple.withOpacity(0.3),
          () {
            _canResendEmail ? _sendVerificationEmail() : null;
          },
          22.w,
          Colors.white,
          4.w,
        ) : const CupertinoActivityIndicator(radius: 10,),
        _canResendEmail
            ? SizedBox(
                height: 0.h,
              )
            : SizedBox(
                height: 0.5.h,
              ),
        _canResendEmail
            ? const Text("")
            : Text(
                "Resend Email Will Be Available After 60 Seconds ",
                style: TextStyle(color: Theme.of(context).errorColor),
              ),
        SizedBox(
          height: 1.h,
        ),
        RoundedButton(
          "Cancel",
          Colors.deepPurple.withOpacity(0.3),
          () {
            FirebaseAuth.instance.signOut();
            Provider.of<UserFormControl>(context, listen: false).logoutMode();
          },
          28.w,
          Colors.black87,
          4.w,
        ),
      ],
    );
  }
}
