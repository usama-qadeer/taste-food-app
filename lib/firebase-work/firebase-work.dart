import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseWork {
  static Future<String?> loginAcct(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
      //print(e);
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String?> signupAcct(
    email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code.length < 6) {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
    //  print(e);
  }

  static Future<String>? sigout() {
    FirebaseAuth.instance.signOut();
  }

  static Future<DocumentSnapshot> signInAnonymously(String id) {
    var result =
        FirebaseFirestore.instance.collection("webadmin").doc(id).get();
    return result;
  }
}
