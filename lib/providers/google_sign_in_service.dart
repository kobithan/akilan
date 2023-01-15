import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService with ChangeNotifier {

  bool _isLogged = false;

  bool get isLogged => _isLogged;

  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<void> googleLogIn(BuildContext context) async {

    final _googleUser = await googleSignIn.signIn();

    if (_googleUser == null) return;
    _user = _googleUser;

    final googleAuth = await _googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {

      _isLogged = true;

      notifyListeners();

      await FirebaseAuth.instance.signInWithCredential(credential);

      _isLogged = false;

      User? user = FirebaseAuth.instance.currentUser;

      if (_user?.email != null && _user?.id!= null) {

        await FirebaseFirestore.instance
            .collection("Shape-Shifter-Fitness-Users")
            .doc(user?.uid)
            .set({
          'ID': _user?.id,
          'Email': user?.email,
          'Mobile-Number': user?.phoneNumber,
          'Name': user?.displayName,
          'Photo-Url': user?.photoURL,
          'Shape-Shifter-User': false,
          'Google-User': true,
        });
      }

      notifyListeners();
    } on FirebaseAuthException catch (error) {
      return showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text("An Error Occurred While Trying To Log In"),
          content: Text("Failed To Log The User Back In : ${error.message}"),
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
    notifyListeners();

  }

  Future<void> signOut() async {
    await googleSignIn.disconnect();
  }
}
