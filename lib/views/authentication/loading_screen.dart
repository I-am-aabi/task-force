import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_1/views/authentication/login/login_page.dart';
// ignore: unused_import
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/navigationbar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: checklogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done ||
            snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == true) {
            return Navbar();
          } else {
            return const LoginPage();
          }
        } else {
          return const Center(child: LoadingAnimation());
        }
      },
    );
  }

  Stream checklogin() async* {
    User? user = FirebaseAuth.instance.currentUser;
    bool loginstatus = user != null;
    if (loginstatus) {
      yield true;
    } else {
      yield false;
    }
  }
}
