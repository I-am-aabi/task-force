import 'package:flutter/material.dart';
import 'package:test_1/models/product_model.dart';
import 'package:test_1/models/transaction_model.dart';

class AppTextControllers {
  static TextEditingController namecontroller = TextEditingController();
  static TextEditingController descriptioncontroller = TextEditingController();
  static TextEditingController pricecontroller = TextEditingController();
  static TextEditingController stockcontroller = TextEditingController();
  static clear() {
    print('field cleared');
    namecontroller.clear();
    descriptioncontroller.clear();
    pricecontroller.clear();
    stockcontroller.clear();
  }

  static preset(Product pr) {
    namecontroller.text = pr.name;
    descriptioncontroller.text = pr.description;
    pricecontroller.text = pr.price.toString();
    stockcontroller.text = pr.stock.toString();
  }

  static presetTrasaction(CustomerTransaction sale) {
    namecontroller.text = sale.name;
    descriptioncontroller.text = sale.date;
    pricecontroller.text = sale.amount.toString();
  }
}
