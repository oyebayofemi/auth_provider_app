import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  late bool _isSigningIn;

  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future<UserCredential?> signInWithGoogle() async {
    isSigningIn = true;

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      isSigningIn = false;
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } else {
      isSigningIn = false;
      return null;
    }
  }

  Future signout() async {
    await FirebaseAuth.instance.signOut();
    // nbvawait GoogleSignIn.signOut();
    await GoogleSignIn().signOut();
    notifyListeners();
  }
}
