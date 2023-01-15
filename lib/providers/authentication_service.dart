import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/google_sign_in_service.dart';
import '../providers/user_form_control.dart';

class AuthenticationService {
  final FirebaseAuth _authentication;

  AuthenticationService(this._authentication);

  Stream<User?> get authStateChanges => _authentication.authStateChanges();

  Future<void> logIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _authentication.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (_authentication.currentUser!.emailVerified == false) {
        _authentication.currentUser?.sendEmailVerification();
      }
    } catch (error) {
      return showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text("An Error Occurred While Trying To Log In"),
          content: Text("Failed To Log The User Back In : $error"),
          actions: [
            CupertinoDialogAction(
              child: const Text("Go Back"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required BuildContext context,
      required String firstName,
      required String lastName}) async {
    try {
      await _authentication.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _authentication.currentUser
          ?.updateDisplayName("$firstName $lastName");
      await _authentication.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (error) {
      return showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text("An Error Occurred While Trying To Sign In"),
                content: Text("Failed To Sign In The User : ${error.message}"),
                actions: [
                  CupertinoDialogAction(
                    child: const Text("Go Back"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }
  }

  Future<void> signOut(BuildContext context) async {
    Provider.of<GoogleSignInService>(context, listen: false).signOut();
    Provider.of<UserFormControl>(context, listen: false).logoutMode();
    await _authentication.signOut();
    FirebaseAuth.instance.signOut();
  }
}
