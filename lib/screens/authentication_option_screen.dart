import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/authentication_signup_form.dart';
import '../widgets/authentication_login_form.dart';
import '../providers/google_sign_in_service.dart';
import '../providers/user_form_control.dart';

class AuthenticationOptionScreen extends StatelessWidget {
  static const routeName = "/authenticationOptionScreen";

  const AuthenticationOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<GoogleSignInService>(context).isLogged;
    final bool _login = Provider.of<UserFormControl>(context).login;
    return _login ? const LoginForm() : const SignUpForm();
  }
}
