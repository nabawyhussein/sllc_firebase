import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInGoogleProvider extends ChangeNotifier {
  final googleLogin = GoogleSignIn();
  GoogleSignInAccount? user;
  Future googleLoginAuth() async {
    final googleUser = await googleLogin.signIn();
    if (googleUser == null) return;
    user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }

  Future googleLogOut() async {

    await googleLogin.disconnect();
    FirebaseAuth.instance.signOut();
    user =null;
    notifyListeners();
  }
}
