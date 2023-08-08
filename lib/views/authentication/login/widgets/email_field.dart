import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/authintication/login_controller.dart';

class Emailfield extends StatelessWidget {
   Emailfield({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          height: 40,
          child: Obx(
            () => TextField(
              onChanged: (value) =>  loginController.errorTextlogin(),
              onTap: () =>  loginController.errorTextlogin(),
              textDirection: TextDirection.ltr,
              controller: LoginController.emailController,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  hintStyle:
                      const TextStyle(color: Colors.white60, fontSize: 18),
                  errorText: loginController.errorMessagelogin.value == ''? null : loginController.errorMessagelogin.value),
            ),
          ),
        ),
      ],
    );
  }
}
