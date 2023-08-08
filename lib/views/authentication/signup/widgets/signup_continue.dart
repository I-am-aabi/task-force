import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/signup/functions/signup.dart';



class SignupContinuebtn extends StatelessWidget {
  const SignupContinuebtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signUp(context);
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          fixedSize: MaterialStateProperty.all(const Size(250, 40)),
          backgroundColor: MaterialStateProperty.all(Colors.blue)),
      child: const Text(
        "Sign up",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
