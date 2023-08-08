import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/views/home/styles_constants.dart/colors.dart';

void noReport(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.popupBackground,
          title: const Center(child: Text('No Transactions')),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text('There were no transactions on your selection')],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                Get.back();
                Get.back();
              },
              child: const Text('Done'),
            ),
          ],
        );
      });
}
