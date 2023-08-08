import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/views/authentication/login/login_page.dart';
import 'package:test_1/views/home/widgets/navigationbar.dart';

class LoginController extends GetxController {
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController namecontroller = TextEditingController();
  RxString errorMessagelogin = ''.obs;
  RxString errorMessagepass = ''.obs;
  RxString errorMessagename = ''.obs;
  static bool errorflag = true;
  static clear() {
    emailController.clear();
    passwordController.clear();
    namecontroller.clear();
  }


  checklogin() {
    User? user = FirebaseAuth.instance.currentUser;
    bool loginstatus = user != null;
    if (loginstatus) {
      Get.to(() => Navbar());
    } else {
      Get.to(() => const LoginPage());
    }
  }

  errorTextlogin() {
    if (emailController.text.isEmpty) {
      errorflag = true;
      errorMessagelogin.value = 'Can\'t be empty';
    } else {
      errorflag = false;
      errorMessagelogin.value = '';
    }
  }

  errorTextpass() {
    if (passwordController.text.isEmpty) {
      errorflag = true;
      errorMessagepass.value = 'Can\'t be empty';
    } else if (passwordController.text.length < 8 &&
        passwordController.text.isNotEmpty) {
      errorflag = true;
      errorMessagepass.value = 'Password must be at least 8 characters';
    } else {
      errorflag = false;

      errorMessagepass.value = '';
    }
  }

  errorTextname() {
    if (namecontroller.text.isEmpty) {
      errorflag = true;
      errorMessagename.value = 'Can\'t be empty';
    } else if (namecontroller.text.length < 4 &&
        namecontroller.text.isNotEmpty) {
      errorflag = true;

      errorMessagename.value = 'Name must be at least 4 characters';
    } else {
      errorflag = false;
      errorMessagename.value = '';
    }
  }
}
