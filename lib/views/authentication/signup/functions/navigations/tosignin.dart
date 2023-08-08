import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/login/login_page.dart';


toSignin(context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
}
