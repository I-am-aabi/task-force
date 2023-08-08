import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class TermsandConditions extends StatelessWidget {
  const TermsandConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: 'By creating an account, you are agreeing to our ',
            style: const TextStyle(color: Colors.white),
            children: [
              TextSpan(
                  text: 'Terms of service ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Text('No data found');
                          });
                    }),
              const TextSpan(
                  text: 'and ', style: TextStyle(color: Colors.white)),
              TextSpan(
                  text: 'privacy policy ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                  recognizer: TapGestureRecognizer()..onTap = () {

                      showDialog(
                          context: context,
                          builder: (context) {
                            return Text('No data found');
                          });
                  })
            ]));
  }
}
