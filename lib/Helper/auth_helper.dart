import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/global.dart';

class AuthHelper {
  static AuthHelper authHelper = AuthHelper();

  signUpData(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Auth.email.text,
        password: Auth.pass.text,
      );
      Navigator.pushReplacementNamed(context, 'home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "The password provided is too weak.",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "The account already exists for that email.",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, color: Colors.black),
          ),
          behavior: SnackBarBehavior.floating,
        ));
      }
    }
  }

  signInData(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Auth.email.text,
        password: Auth.pass.text,
      );
      Navigator.pushReplacementNamed(context, 'home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("hello");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No user found for that email",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, color: Colors.black),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Wrong password provided for that user.",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700, color: Colors.black),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
        ));
      }
    }
  }

  googleData() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
