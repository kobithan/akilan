import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordService with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> resetPassword(String _email, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();

      await Future.delayed(
        const Duration(seconds: 3),
      );

      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      notifyListeners();

      _isLoading = false;
      notifyListeners();

      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text("An Error Occurred While Trying To Verify User"),
          content: Text(
              "Failed To Verify The User : ${error.message} Please Try Again Later"),
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
      _isLoading = false;
      notifyListeners();
    }
  }
}
