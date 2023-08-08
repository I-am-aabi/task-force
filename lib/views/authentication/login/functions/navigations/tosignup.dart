import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/signup/sign_up.dart';


toSignup(context) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signuppage(),
      ));
}
