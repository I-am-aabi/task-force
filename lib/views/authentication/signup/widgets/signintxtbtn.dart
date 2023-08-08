import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/signup/functions/navigations/tosignin.dart';



class Signintxtbtn extends StatelessWidget {
  const Signintxtbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(fontSize: 14,color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: () {
            toSignin(context);
          },
          child: const Text(
            "Sign in",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
