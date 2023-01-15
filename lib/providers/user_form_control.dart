import 'package:flutter/material.dart';

class UserFormControl with ChangeNotifier {

  bool _login = true;

  bool get login => _login;

  bool visibility = true;

  void switchMode() async {
    _login = !_login;
    notifyListeners();
  }

  void logoutMode() {
    _login = true;
  }

  void toggle() {
    visibility = !visibility;
    notifyListeners();
  }

  void reset() {
    visibility = true;
    notifyListeners();
  }

}
