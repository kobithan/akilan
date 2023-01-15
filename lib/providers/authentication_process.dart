import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/authentication_service.dart';

class AuthenticationProcess with ChangeNotifier {
  bool _isLogged = false;

  bool get isLogged => _isLogged;

  Future<void> userLogIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    _isLogged = true;
    notifyListeners();

    await context.read<AuthenticationService>().logIn(
          email: email,
          password: password,
          context: context,
        );

    _isLogged = false;

    notifyListeners();
  }

  Future<void> userSignUp(BuildContext context, String _email, String _password,
      String _fName, String _lName, String _age, String _mobile) async {
    _isLogged = true;
    notifyListeners();

    await context.read<AuthenticationService>().signUp(
          email: _email,
          password: _password,
          context: context,
          firstName: _fName,
          lastName: _lName,
        );

    User? userData = FirebaseAuth.instance.currentUser;

    if (userData?.email != null && userData?.uid != null) {
      await FirebaseFirestore.instance
          .collection("Shape-Shifter-Fitness-Users")
          .doc(userData?.uid)
          .set(
        {
          'UID': userData?.uid,
          'Email': userData?.email,
          'Password': _password,
          'FirstName': _fName,
          'LastName': _lName,
          'Age': _age,
          'Mobile': _mobile,
          'Shape-Shifter-User': true,
          'Google-User': false,
        },
      );
      notifyListeners();
    }

    if (userData?.email != null && userData?.uid != null) {
      await FirebaseFirestore.instance
          .collection("User-App-Data")
          .doc(userData?.uid)
          .set(
        {
          'UID': userData?.uid,
          'Workout-Total-Cal': 0.0,
          'Workout-Burnt-Cal': 0.0,
          'Diet-Total-Cal': 0.0,
          'Protein': 0.0,
          'Carb': 0.0,
          'Fat': 0.0,
          'TookCarb' : 00.0,
          'tookProtein' : 0.0,
          'tookFat' : 0.0,
        },
      );
      notifyListeners();
    }

    _isLogged = false;
    notifyListeners();
  }
}
