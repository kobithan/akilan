import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import '../widgets/authentication_inputs.dart';
import '../widgets/rounded_buttons.dart';
import '../providers/authentication_validation.dart';
import '../providers/authentication_process.dart';
import '../providers/user_form_control.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  static final _formKey = GlobalKey<FormState>();

  final bool _visibility = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _mobileFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  Widget _space(double padding) {
    return SizedBox(
      height: padding,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _age.dispose();
    _mobileNumber.dispose();
    _confirmPassword.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _ageFocusNode.dispose();
    _mobileFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final bool _isLogged = Provider.of<AuthenticationProcess>(context).isLogged;

    final _authenticationValidation =
        Provider.of<AuthenticationValidation>(context);

    final _authenticationProcess =
        Provider.of<AuthenticationValidation>(context, listen: false);

    final userData = Provider.of<UserFormControl>(context, listen: false);

    final _isErrorEmail = _authenticationValidation.isEmailSignInError;

    final _isErrorPassword = _authenticationValidation.isPasswordSignInError;

    final _isErrorFirstName = _authenticationValidation.firstName;

    final _isErrorLastName = _authenticationValidation.lastName;

    final _isErrorAge = _authenticationValidation.age;

    final _isErrorMobileNumber = _authenticationValidation.mobileNumber;

    final _isErrorConfirmPassword = _authenticationValidation.confirmPassword;

    final _errorTextMessageEmail =
        _authenticationValidation.errorMessageSignInEmail;

    final _errorTextMessagePassword =
        _authenticationValidation.errorMessageSignInPassword;

    final _errorTextMessageFirstName =
        _authenticationValidation.errorMessageFirstName;

    final _errorTextMessageLastName =
        _authenticationValidation.errorMessageLastName;

    final _errorTextMessageAge = _authenticationValidation.errorMessageAge;

    final _errorTextMessageMobileNumber =
        _authenticationValidation.errorMessageMobileNumber;

    final _errorTextMessageConfirmPassword =
        _authenticationValidation.errorMessageConfirmPassword;

    Widget _errorMessage(String text) {
      return SizedBox(
          width: 75.w,
          child: _isErrorEmail ||
                  _isErrorPassword ||
                  _isErrorFirstName ||
                  _isErrorLastName ||
                  _isErrorAge ||
                  _isErrorMobileNumber ||
                  _isErrorConfirmPassword
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        resizeToAvoidBottomInset: true,
        body: _isLogged
            ? const Center(
                child: CupertinoActivityIndicator(
                  radius: 10,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormFields(
                              "First Name",
                              Icons.drive_file_rename_outline,
                              Colors.deepPurple,
                              Colors.deepPurple.withOpacity(0.3),
                              _firstName,
                              !_visibility,
                              TextInputAction.next,
                              () {},
                              TextInputType.text,
                              false,
                              _isErrorFirstName,
                              _firstNameFocusNode,
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_lastNameFocusNode);
                              },
                            ),
                            _errorMessage(_errorTextMessageFirstName),
                            _space(1.h),
                            FormFields(
                              "Last Name",
                              Icons.drive_file_rename_outline,
                              Colors.deepPurple,
                              Colors.deepPurple.withOpacity(0.3),
                              _lastName,
                              !_visibility,
                              TextInputAction.next,
                              () {},
                              TextInputType.text,
                              false,
                              _isErrorLastName,
                              _lastNameFocusNode,
                              () {
                                FocusScope.of(context).requestFocus(_ageFocusNode);
                              },
                            ),
                            _errorMessage(_errorTextMessageLastName),
                            _space(1.h),
                            FormFields(
                              "Age",
                              Icons.support_agent_rounded,
                              Colors.deepPurple,
                              Colors.deepPurple.withOpacity(0.3),
                              _age,
                              !_visibility,
                              TextInputAction.next,
                              () {},
                              TextInputType.number,
                              false,
                              _isErrorAge,
                              _ageFocusNode,
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_mobileFocusNode);
                              },
                            ),
                            _errorMessage(_errorTextMessageAge),
                            _space(1.h),
                            FormFields(
                              "Mobile Number (077-111-1110)",
                              Icons.drive_file_rename_outline,
                              Colors.deepPurple,
                              Colors.deepPurple.withOpacity(0.3),
                              _mobileNumber,
                              !_visibility,
                              TextInputAction.next,
                              () {},
                              TextInputType.phone,
                              false,
                              _isErrorMobileNumber,
                              _mobileFocusNode,
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_emailFocusNode);
                              },
                            ),
                            _errorMessage(_errorTextMessageMobileNumber),
                            _space(1.h),
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
                            _space(1.h),
                            FormFields(
                              "Password",
                              Icons.vpn_key_rounded,
                              Colors.deepPurple,
                              Colors.deepPurple.withOpacity(0.3),
                              _passwordController,
                              _visibility,
                              TextInputAction.next,
                              () {},
                              TextInputType.text,
                              true,
                              _isErrorPassword,
                              _passwordFocusNode,
                              () {
                                FocusScope.of(context)
                                    .requestFocus(_confirmPasswordFocusNode);
                              },
                            ),
                            _errorMessage(_errorTextMessagePassword),
                            _space(1.h),
                            FormFields(
                              "Confirm Password",
                              Icons.vpn_key_rounded,
                              Colors.deepPurple,
                              Colors.deepPurple.withOpacity(0.3),
                              _confirmPassword,
                              _visibility,
                              TextInputAction.done,
                              () {},
                              TextInputType.text,
                              false,
                              _isErrorConfirmPassword,
                              _confirmPasswordFocusNode,
                              () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    _errorMessage(_errorTextMessageConfirmPassword),
                    _space(1.5.h),
                    RoundedButton(
                      "SignUp",
                      Colors.deepPurple,
                      () {
                        _authenticationProcess.userSignInValidation(
                          context,
                          _firstName.text.trim(),
                          _lastName.text.trim(),
                          _age.text.trim(),
                          _mobileNumber.text.trim(),
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                          _confirmPassword.text.trim(),
                        );
                        userData.reset();
                      },
                      24.w,
                      Colors.white,
                      4.w,
                    ),
                    _space(1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have An Account ? ",
                          style: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                        Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                    _space(1.h),
                    RoundedButton(
                      "Login",
                      Colors.deepPurple.withOpacity(0.3),
                      () {
                        userData.switchMode();
                        userData.reset();
                        _authenticationProcess.validationData(
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          false,
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                        );
                      },
                      25.w,
                      Colors.black87,
                      4.w,
                    ),
                    _space(3.5.h),
                    Text("Shape Shifter Fitness (SriLanka) Limited.", style: TextStyle(fontSize: 10.sp),),
                  ],
                ),
              ),
      ),
    );
  }
}
