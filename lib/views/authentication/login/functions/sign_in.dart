import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_1/controllers/authintication/login_controller.dart';

import 'package:test_1/views/home/widgets/navigationbar.dart';


signIn(context) {
  LoginController.errorflag == false ?
  FirebaseAuth.instance
      .signInWithEmailAndPassword(
          email: LoginController.emailController.text.trim(),
          password: LoginController.passwordController.text.trim())
      .then((value) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Navbar(),
          )))
      .then((value) {
    Fluttertoast.showToast(
        msg: 'signed in successfully', backgroundColor: Colors.green);
  }).
  onError((error, stackTrace) {
    Fluttertoast.showToast(msg: 'Email or password doesn\'t match');
  }): Fluttertoast.showToast(
        msg: 'check for the errors', backgroundColor: const Color.fromARGB(255, 224, 72, 38));
 LoginController.clear();
}
