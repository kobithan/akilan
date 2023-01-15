import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../providers/reset_password_service.dart';
import '../providers/authentication_process.dart';

class AuthenticationValidation with ChangeNotifier {
  var _isEmailError = false;

  var _isEmailSignInError = false;

  var _firstNameError = false;

  var _lastNameError = false;

  var _ageError = false;

  var _mobileNumberError = false;

  var _confirmPasswordError = false;

  var _isPasswordError = false;

  var _isPasswordSignInError = false;

  String _errorMessageEmail = "";

  String _errorMessageSignInEmail = "";

  String _errorMessagePassword = "";

  String _errorMessageSignInPassword = "";

  String _errorMessageFirstName = "";

  String _errorMessageLastName = "";

  String _errorMessageAge = "";

  String _errorMessageMobileNumber = "";

  String _errorMessageConfirmPassword = "";

  get isEmailError => _isEmailError;

  get isEmailSignInError => _isEmailSignInError;

  get isPasswordError => _isPasswordError;

  get isPasswordSignInError => _isPasswordSignInError;

  get confirmPassword => _confirmPasswordError;

  get firstName => _firstNameError;

  get lastName => _lastNameError;

  get age => _ageError;

  get mobileNumber => _mobileNumberError;

  String get errorMessageEmail => _errorMessageEmail;

  String get errorMessageSignInEmail => _errorMessageSignInEmail;

  String get errorMessagePassword => _errorMessagePassword;

  String get errorMessageSignInPassword => _errorMessageSignInPassword;

  String get errorMessageFirstName => _errorMessageFirstName;

  String get errorMessageLastName => _errorMessageLastName;

  String get errorMessageAge => _errorMessageAge;

  String get errorMessageMobileNumber => _errorMessageMobileNumber;

  String get errorMessageConfirmPassword => _errorMessageConfirmPassword;

  void validateEmail (bool _emailError, String _emailMsg) {
    _isEmailError = _emailError;
    _errorMessageEmail = _emailMsg;
  }

  void emailValidation(BuildContext context, String _email){

    if (_email.isEmpty) {
      validateEmail(true, "Cannot Be Empty, Email Address Is Required");
      notifyListeners();
    } else if (!EmailValidator.validate(_email)) {
      validateEmail(true, "Not A Valid Email Address, Must Contain '@' Must Contain '.'");
      notifyListeners();
    }
    else{
      validateEmail(false, "");
      Provider.of<ResetPasswordService>(context, listen: false).resetPassword(_email, context);
      notifyListeners();
    }
  }

  void validateLoginData (bool _emailError,
      bool _passwordError,String _emailMsg,
      String _passwordMsg) {
    _isEmailError = _emailError;
    _isPasswordError = _passwordError;
    _errorMessageEmail = _emailMsg;
    _errorMessagePassword = _passwordMsg;
  }

  void emailPasswordValidation(BuildContext context, String _email, String _password) {

    if (_email.isEmpty) {
      validateLoginData(true, false, "Cannot Be Empty, Email Address Is Required", "");
      notifyListeners();
    } else if (!EmailValidator.validate(_email)) {
      validateLoginData(true, false, "Not A Valid Email Address, Must Contain '@' Must Contain '.'", "");
      notifyListeners();
    } else if (_password.isEmpty) {
      validateLoginData(false, true, "", "Cannot Be Empty, Password Is Required");
      notifyListeners();
    }else {
      validateLoginData(false, false, "", "");
      Provider.of<AuthenticationProcess>(context, listen: false).userLogIn(context, _email, _password);
      notifyListeners();
    }
    notifyListeners();
  }

  void validationData(
      bool _emailError,
      bool _passwordError,
      bool _fNameError,
      bool _lNameError,
      bool _agesError,
      bool _contactError,
      bool _confirmPwdError,
      String _emailMsg,
      String _passwordMsg,
      String _fNameMsg,
      String _lNameMsg,
      String _ageMsg,
      String _contactMsg,
      String _confirmMsg,) {
    _isEmailSignInError = _emailError;
    _isPasswordSignInError = _passwordError;
    _firstNameError = _fNameError;
    _lastNameError = _lNameError;
    _ageError = _agesError;
    _mobileNumberError = _contactError;
    _confirmPasswordError = _confirmPwdError;
    _errorMessageSignInEmail = _emailMsg;
    _errorMessageSignInPassword = _passwordMsg;
    _errorMessageFirstName = _fNameMsg;
    _errorMessageLastName = _lNameMsg;
    _errorMessageAge = _ageMsg;
    _errorMessageMobileNumber = _contactMsg;
    _errorMessageConfirmPassword = _confirmMsg;
  }

  void userSignInValidation(BuildContext context, String _firstName, String _lastName, String _age, String _mobileNumber, String _email, String _password, String _confirmPassword) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (_firstName.isEmpty) {
    validationData(false, false, true, false, false, false, false,
    "", "", "First Name Field Cannot Be Empty, First Name Is Required", "", "", "", "");
    notifyListeners();
    }
    else if (_lastName.isEmpty) {
      validationData(false, false, false, true, false, false, false,
          "", "", "", "Last Name Field Cannot Be Empty, Last Name Is Required", "", "", "");
      notifyListeners();
    }
    else if (_age.isEmpty) {
      validationData(false, false, false, false, true, false, false,
          "", "", "", "", "Age Field Cannot Be Empty, Age Is Required", "", "");
      notifyListeners();
    }
    else if (_age.length != 2) {
      validationData(false, false, false, false, true, false, false,
          "", "", "", "", "Invalid Age", "", "");
      notifyListeners();
    }
    else if (_mobileNumber.isEmpty) {
      validationData(false, false, false, false, false, true, false,
          "", "", "", "", "", "Mobile Number Field Cannot Be Empty, Mobile Number Is Required", "");
      notifyListeners();
    }
    else if (_mobileNumber.length != 10) {
      validationData(false, false, false, false, false, true, false,
          "", "", "", "", "", "Invalid Mobile Number, Number Should Contain Exact 10 Digits", "");
      notifyListeners();
    }
    else if (_email.isEmpty) {
      validationData(true, false, false, false, false, false, false,
          "Cannot Be Empty, Email Address Is Required", "", "", "", "", "", "");
      notifyListeners();
    } else if (!EmailValidator.validate(_email)) {
      validationData(true, false, false, false, false, false, false,
          "Not A Valid Email Address, Must Contain '@' Must Contain '.'", "", "", "", "", "", "");
      notifyListeners();
    } else if (_password.isEmpty) {
      validationData(false, true, false, false, false, false, false,
          "", "Cannot Be Empty, Password Is Required", "", "", "", "", "");
      notifyListeners();
    } else if (!regExp.hasMatch(_password)) {
      validationData(false, true, false, false, false, false, false,
          "", "Password Must Be At Least 8 Characters Long, Include An UpperCase Letter[A-Z], Number[0-9], And Symbol", "", "", "", "", "");
      notifyListeners();
    }    else if (_confirmPassword.isEmpty) {
      validationData(false, false, false, false, false, false, true,
          "", "", "", "", "", "", "Cannot Be Empty, Password Must Be Confirmed");
      notifyListeners();
    } else if (_confirmPassword != _password) {
      validationData(false, false, false, false, false, false, true,
          "", "", "", "", "", "", "Password Do Not Match, Please Enter The Correct Password");
      notifyListeners();
    }   else {
      Provider.of<AuthenticationProcess>(context, listen: false).userSignUp(
        context,
        _email,
        _password,
        _firstName,
        _lastName,
        _age,
        _mobileNumber,
      );
      validationData(false, false, false, false, false, false, false,
          "", "", "", "", "", "", "");
      notifyListeners();
    }
    notifyListeners();
  }
}
