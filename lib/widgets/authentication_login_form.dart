import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../providers/authentication_validation.dart';
import '../widgets/authentication_inputs.dart';
import '../widgets/rounded_buttons.dart';
import '../widgets/svg_assets.dart';
import '../providers/user_form_control.dart';
import '../providers/authentication_process.dart';
import '../screens/reset_password_screen.dart';
import '../providers/google_sign_in_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static final _formKey = GlobalKey<FormState>();

  final _visibility = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool _isLoggedGoogle = Provider.of<GoogleSignInService>(context).isLogged;

    final userData = Provider.of<UserFormControl>(context, listen: false);

    final bool _isLogged = Provider.of<AuthenticationProcess>(context).isLogged;

    final _authenticationProcess = Provider.of<AuthenticationValidation>(context, listen: false);

    final _authenticationValidation = Provider.of<AuthenticationValidation>(context);

    final _isErrorEmail = _authenticationValidation.isEmailError;

    final _isErrorPassword = _authenticationValidation.isPasswordError;

    final _errorTextMessageEmail = _authenticationValidation.errorMessageEmail;

    final _errorTextMessagePassword = _authenticationValidation.errorMessagePassword;

    final bool _orientation = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget _errorMessage(String text) {
      return SizedBox(
          width: 75.w,
          child: _isErrorEmail || _isErrorPassword
              ? Text(
                  text,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                )
              : null);
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _isLogged || _isLoggedGoogle
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 10,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _orientation ? SvgImage(80.w, 50.h) : SvgImage(80.w, 30.h),
                    _orientation
                        ? SizedBox(height: 1.h)
                        : SizedBox(height: 1.h),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          FormFields(
                            "shapeshifterfitness@gmail.com",
                            Icons.person,
                            Colors.deepPurple,
                            Colors.deepPurple.withOpacity(0.3),
                            _emailController,
                            !_visibility,
                            TextInputAction.next,
                            () {},
                            TextInputType.emailAddress,
                            false,
                            _isErrorEmail,
                            _emailFocusNode,
                            () {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                          ),
                          _errorMessage(_errorTextMessageEmail),
                          SizedBox(
                            height: 1.h,
                          ),
                          FormFields(
                            "Password",
                            Icons.vpn_key_rounded,
                            Colors.deepPurple,
                            Colors.deepPurple.withOpacity(0.3),
                            _passwordController,
                            _visibility,
                            TextInputAction.done,
                            () {},
                            TextInputType.text,
                            true,
                            _isErrorPassword,
                            _passwordFocusNode,
                            () {},
                          ),
                        ],
                      ),
                    ),
                    _errorMessage(_errorTextMessagePassword),
                    TextButton(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                          fontSize: 11.sp,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ResetPasswordScreen.routeName);
                      },
                    ),
                    RoundedButton(
                      "Login",
                      Colors.deepPurple,
                      () {
                        _authenticationProcess.emailPasswordValidation(
                            context,
                            _emailController.text.trim(),
                            _passwordController.text.trim());
                        userData.reset();
                      },
                      25.w,
                      Colors.white,
                      4.w,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have An Account ? ",
                          style: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    RoundedButton(
                      "SignUp",
                      Colors.deepPurple.withOpacity(0.3),
                      () {
                        userData.switchMode();
                        _authenticationProcess.validateLoginData(
                          false,
                          false,
                          "",
                          "",
                        );
                        userData.reset();
                      },
                      23.w,
                      Colors.black87,
                      4.w,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Divider(height: 1.h,color: Colors.black26,)),
                        Padding(
                          padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 0.5, bottom: 0.5),
                          child: Text("OR", style: TextStyle(color: Colors.deepPurple, fontSize: 10.sp, fontWeight: FontWeight.bold,),),
                        ),
                        Expanded(child: Divider(height: 1.h,color: Colors.black26)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.google),
                          onPressed: () {
                            Provider.of<GoogleSignInService>(context,
                                listen: false)
                                .googleLogIn(context);
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.facebook),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.apple),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
