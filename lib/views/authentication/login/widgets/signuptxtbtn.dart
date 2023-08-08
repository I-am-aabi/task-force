import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/login/functions/navigations/tosignup.dart';



class Signuptxtbtn extends StatelessWidget {
  const Signuptxtbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account?',
          style: TextStyle(fontSize: 14,color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            toSignup(context);
          },
          child: const Text(
            "Sign up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
