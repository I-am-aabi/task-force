import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/customer_controller.dart';
import 'package:test_1/controllers/transaction_controller.dart';
import 'package:test_1/models/customer_model.dart';
import 'package:test_1/views/sales/sales_page.dart';
import 'package:test_1/views/styles_constants.dart/colors.dart';
import 'package:test_1/views/styles_constants.dart/styles.dart';

class CustomerCard extends StatelessWidget {
  CustomerCard({super.key, required this.customer, required this.index});
  final Customer customer;
  final int index;
  final CustomerController customerController = Get.find();
  final TransactionController transactionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () async {
          transactionController.resetResult();
          Get.to(() => CustomerSalesPage());
          customerController.select(customer);
          await transactionController.fetchTransaction();
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.getcolor(index),
          ),
          child: Center(
              child: Text(
            customer.name,
            style: TextStylesCollection.customerName,
          )),
        ),
      ),
    );
  }
}
