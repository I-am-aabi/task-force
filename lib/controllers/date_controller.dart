import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_1/controllers/product_text_controllers.dart';

class DateController extends GetxController {
  RxString date = 'No date selected'.obs;

  selectDate(BuildContext context) async {
    date.value = await pickDate(context);
    AppTextControllers.descriptioncontroller.text = date.value;
  }

  Future<String> pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), 
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String selectedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      return selectedDate;
    } else {
      return 'No date picked';
    }
  }
}
