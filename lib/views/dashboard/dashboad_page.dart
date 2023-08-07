import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/customer_controller.dart';
import 'package:test_1/controllers/date_controller.dart';
import 'package:test_1/controllers/product_data_controller.dart';
import 'package:test_1/controllers/pdf_controller.dart';
import 'package:test_1/controllers/transaction_controller.dart';

class DashboardPage extends StatelessWidget {
   DashboardPage({super.key});
  final ProductController productController = Get.put(ProductController());
  final TransactionController transactionController = Get.put(TransactionController());
  final DateController dateController = Get.put(DateController());
  final PdfController storageController = Get.put(PdfController());
  // final CustomerController customerController = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
