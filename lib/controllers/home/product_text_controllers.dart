import 'package:flutter/material.dart';
import 'package:test_1/models/customer_model.dart';
import 'package:test_1/models/product_model.dart';
import 'package:test_1/models/transaction_model.dart';

class AppTextControllers {
  static TextEditingController namecontroller = TextEditingController();
  static TextEditingController descriptioncontroller = TextEditingController();
  static TextEditingController pricecontroller = TextEditingController();
  static TextEditingController stockcontroller = TextEditingController();
  static TextEditingController searchcontroller = TextEditingController();
  static clear() {
    namecontroller.clear();
    descriptioncontroller.clear();
    pricecontroller.clear();
    stockcontroller.clear();
    searchcontroller.clear();
  }

  static preset(Product pr) {
    namecontroller.text = pr.name;
    descriptioncontroller.text = pr.description;
    pricecontroller.text = pr.price.toString();
    stockcontroller.text = pr.stock.toString();
  }

  static presetCustomer(Customer customer) {
    namecontroller.text = customer.name;
    descriptioncontroller.text = customer.adress;
    pricecontroller.text = customer.phone.toString();
  }

  static presetTrasaction(CustomerTransaction sale) {
    namecontroller.text = sale.name;
    descriptioncontroller.text = sale.date;
    pricecontroller.text = sale.amount.toString();
  }
}
