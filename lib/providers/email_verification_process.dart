import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class EmailVerificationProcess with ChangeNotifier {
  bool _canResendEmail = true;

  bool get canResendEmail => _canResendEmail;

  Future<void> sendVerificationEmail(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser!;

      await user.sendEmailVerification();

      _canResendEmail = false;
      notifyListeners();

      await Future.delayed(
        const Duration(minutes: 1),
      );

      _canResendEmail = true;

      notifyListeners();
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
      notifyListeners();
    }
  }

  Future<void> toggleCanResendEmail() async {

    _canResendEmail = false;

    await Future.delayed(
      const Duration(minutes: 1),
    );

    _canResendEmail = true;

    notifyListeners();
  }
}
