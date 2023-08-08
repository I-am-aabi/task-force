import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_1/controllers/authintication/login_controller.dart';
import 'package:test_1/views/authentication/login/widgets/email_field.dart';
import 'package:test_1/views/home/widgets/navigationbar.dart';




signUp(context) {
  LoginController.errorflag == false ?
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: LoginController.emailController.text.trim(),
          password:LoginController.passwordController.text.trim())
      .then((value) {
    User? user = FirebaseAuth.instance.currentUser;
    user!.updateDisplayName(LoginController.namecontroller.text.toString());
     FirebaseFirestore.instance
        .collection('students')
        .doc(LoginController.namecontroller.text.toString() + user.uid)
        .set({
          'name' : LoginController.namecontroller.text.toString(),
          'uid' : user.uid,
          'subscriptions' : [],
          'favorites' : [],
        });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  Navbar()));
    LoginController.clear();
  }):  Fluttertoast.showToast(
        msg: 'check for the errors', backgroundColor: const Color.fromARGB(255, 212, 29, 29));
}

