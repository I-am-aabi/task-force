import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/authintication/login_controller.dart';

class Passfield extends StatelessWidget {
  Passfield({super.key});
  final LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    String? error = null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          height: 40,
          child: Obx(
            () => TextField(
              controller: LoginController.passwordController,
              onChanged: (value) => loginController.errorTextpass(),
              onTap: () {
                loginController.errorTextpass();
              },
              textDirection: TextDirection.ltr,
              obscureText: true,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: '*************',
                  hintStyle:
                      const TextStyle(color: Colors.white60, fontSize: 18),
                  errorText: loginController.errorMessagepass.value == ''
                      ? null
                      : loginController.errorMessagepass.value),
            ),
          ),
        ),
      ],
    );
  }
}
