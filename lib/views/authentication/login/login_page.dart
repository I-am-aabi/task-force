import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/login/widgets/email_field.dart';
import 'package:test_1/views/authentication/login/widgets/forgot_pass.dart';
import 'package:test_1/views/authentication/login/widgets/or_text.dart';
import 'package:test_1/views/authentication/login/widgets/password_field.dart';
import 'package:test_1/views/authentication/login/widgets/signin_continue.dart';
import 'package:test_1/views/authentication/login/widgets/signuptxtbtn.dart';
import 'package:test_1/views/authentication/login/widgets/welcome_text.dart';
import 'package:test_1/views/authentication/signup/widgets/terms.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Padding(
        padding:  const EdgeInsets.all(10.0),
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
                padding: const EdgeInsets.only(left:30.0,right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const SizedBox(height: 30,),
                    const WelcomeText(heading: 'Welcome!',discription: 'Sign in to continue'),
                    const SizedBox(
                      height: 50,
                    ),
                    Emailfield(),
                    const SizedBox(
                      height: 40,
                    ),
                     Passfield(),
                    const SizedBox(
                      height: 50,
                    ),
                    const Center(child: SigninContinuebtn()),
                    const Forgotpass(),
                    const SizedBox(
                      height: 10,
                    ),
                    const Ortext(),
                    const SizedBox(height: 25,),
                    const Signuptxtbtn(),
                    const SizedBox(height: 20,),
                    const TermsandConditions()
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