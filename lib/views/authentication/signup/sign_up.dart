import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/login/widgets/email_field.dart';
import 'package:test_1/views/authentication/login/widgets/or_text.dart';
import 'package:test_1/views/authentication/login/widgets/password_field.dart';
import 'package:test_1/views/authentication/login/widgets/welcome_text.dart';
import 'package:test_1/views/authentication/signup/widgets/confpasss.dart';
import 'package:test_1/views/authentication/signup/widgets/signintxtbtn.dart';
import 'package:test_1/views/authentication/signup/widgets/signup_continue.dart';
import 'package:test_1/views/authentication/signup/widgets/terms.dart';



class Signuppage extends StatelessWidget {
  const Signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              padding: EdgeInsets.zero,
              iconSize: 40,
              onPressed: () {
                // Navigator.pop(context);
              },
              alignment: Alignment.topLeft,
            ),
             SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(
                      height: 30,
                    ),
                    const WelcomeText(
                        heading: 'Hi!', discription: 'Create a new account'),
                    const SizedBox(
                      height: 50,
                    ),
                     Username(),
                    const SizedBox(
                      height: 40,
                    ),
                    Emailfield(),
                    const SizedBox(
                      height: 40,
                    ),
                     Passfield(),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(child: SignupContinuebtn()),
                    // Forgotpass(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Ortext(),
                   
                    const SizedBox(
                      height: 25,
                    ),
                    const Signintxtbtn(),
                    const SizedBox(
                      height: 20,
                    ),const TermsandConditions()
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
