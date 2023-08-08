import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/login/functions/sign_in.dart';


class SigninContinuebtn extends StatelessWidget {
  const SigninContinuebtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signIn(context);
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
        "Sign in",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}
