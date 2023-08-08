import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/views/authentication/loading_screen.dart';

import 'package:test_1/views/home/styles_constants.dart/colors.dart';

void logoutPopup(BuildContext context) {
  final _auth = FirebaseAuth.instance;

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('Logout')),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Are you sure you want to Logout ')],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Navigator.of(context).pop();
                Get.back();
                await _auth.signOut();
                Get.to(() => const LoadingScreen());
              },
              child: const Text('Log out'),
            ),
          ],
        );
      });
}
