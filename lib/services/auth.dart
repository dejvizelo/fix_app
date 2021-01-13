import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signUp ({BuildContext context, String email, String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logIn ({BuildContext context, String email, String password}) async {
    try {
      UserCredential userCredentials = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (Route<dynamic> route) => false);
  }
}