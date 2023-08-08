import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/authintication/login_controller.dart';

class Username extends StatelessWidget {
   Username({super.key});

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          ()=> SizedBox(
            width: 280,
            height: 40,
            child: TextField(
              onChanged: (value) => loginController.errorTextname(),
              onTap: () => loginController.errorTextname(),
              controller: LoginController.namecontroller,
              keyboardType: TextInputType.visiblePassword,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  hintText: 'Tony Stark',
                  hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
                  errorText: loginController.errorMessagename.value == ''? null : loginController.errorMessagename.value),
            ),
          ),
        ),
      ],
    );
  }
}
