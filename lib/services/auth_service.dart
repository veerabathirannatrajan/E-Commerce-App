import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

//   SIGN UP
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String dob,
    required String gender,


  }) async {
    try {
      //  Create Auth user
      UserCredential credential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User user = credential.user!;

      //  Save name in FirebaseAuth
      await user.updateDisplayName(name);

      //  Device info
      final deviceInfo = DeviceInfoPlugin();
      String device = "Unknown";

      if (Platform.isAndroid) {
        final info = await deviceInfo.androidInfo;
        device = "${info.brand} ${info.model}";
      } else if (Platform.isIOS) {
        final info = await deviceInfo.iosInfo;
        device = info.utsname.machine ?? "iPhone";
      }

      //  time
      final String createdAt =
      DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.now());

      // Write to Firestore
      await _db.collection('users').doc(user.uid).set({
        "uid": user.uid,
        "name": name,
        "email": user.email,
        "dob": dob,
        "gender": gender,
        "createdAt": createdAt,
        "device": device,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception("Account already exists. Please login.");
      } else if (e.code == 'weak-password') {
        throw Exception("Password is too weak.");
      } else if (e.code == 'invalid-email') {
        throw Exception("Invalid email address.");
      } else {
        throw Exception("Signup failed. Try again.");
      }
    }
  }

//   LOGIN
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );



      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("No account found with this email.");
      } else if (e.code == 'wrong-password') {
        throw Exception("Incorrect password.");
      } else if (e.code == 'invalid-email') {
        throw Exception("Invalid email address.");
      } else {
        throw Exception("Login failed. Try again.");
      }
    }
  }

//   FORGOT PASSWORD
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception("No user found for this email.");
      } else {
        throw Exception("Failed to send reset email.");
      }
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

//   CURRENT USER
  User? get currentUser => _auth.currentUser;
}
