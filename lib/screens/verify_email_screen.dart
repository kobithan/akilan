import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shape_shifter_fitness_application/screens/demo_main_screen.dart';
import 'package:shape_shifter_fitness_application/screens/home_screen.dart';
import 'package:shape_shifter_fitness_application/screens/navigation_screen.dart';

import '../providers/email_verification_process.dart';
import '../widgets/verify_email.dart';

class EmailVerification extends StatefulWidget {

  static const routeName = "/EmailVerificationScreen";

  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool _isVerified = false;

  Timer? _timer;

  @override
  void initState() {
    _isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!_isVerified) {
      _toggleCanResendEmail();

      _timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => _checkEmailVerified(),
      );
    }
    super.initState();
  }

  Future<void> _sendVerificationEmail() async {
    await Provider.of<EmailVerificationProcess>(context, listen: false)
        .sendVerificationEmail(context);
  }

  Future<void> _toggleCanResendEmail() async {
    await Provider.of<EmailVerificationProcess>(context, listen: false)
        .toggleCanResendEmail();
  }

  Future<void> _checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    setState(() {
      _isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (_isVerified) {
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _emailVerification = Provider.of<EmailVerificationProcess>(context);
    final bool _canResendEmail = _emailVerification.canResendEmail;
    final _email = FirebaseAuth.instance.currentUser!.email;
    return _isVerified
        ? const DemoMainScreen()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            body: VerifyEmailContent(
                _email, _canResendEmail, _sendVerificationEmail),
          );
  }
}
