import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/customer_controller.dart';
import 'package:test_1/controllers/home/date_controller.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';

import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/dashboard/widgets/dashboard_card.dart';
import 'package:test_1/views/home/styles_constants.dart/styles.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final ProductController productController = Get.put(ProductController());
  final TransactionController transactionController =
      Get.put(TransactionController());
  final DateController dateController = Get.put(DateController());
  final PdfController storageController = Get.put(PdfController());
  final CustomerController customerController = Get.find();
  final User? user = FirebaseAuth.instance.currentUser;
  // final CustomerController customerController = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStylesCollection.headingstyle(),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Hello ',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                user!.displayName!,
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Welcome back',
            style: TextStylesCollection.headingstyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => DashCard(
                      colorIndex: 0,
                      icon: Icons.monetization_on,
                      text1: 'Total',
                      text2: 'Transaction',
                      text3: transactionController.totaltransaction.value
                          .toString(),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Obx(
                      () => DashCard(
                        colorIndex: 1,
                        icon: Icons.inventory_2_outlined,
                        text1: 'Total',
                        text2: 'Product count',
                        text3: productController.productcount.value.toString(),
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Obx(
                      () => DashCard(
                          icon: Icons.person,
                          text1: 'Total',
                          text2: 'Customers',
                          colorIndex: 2,
                          text3: customerController.customerscount.value
                              .toString()),
                    )),
                 Expanded(
                    flex: 1,
                    child: Obx(
                      ()=>  DashCard(
                        colorIndex: 3,
                        icon: Icons.shopping_cart,
                        text1: 'Total',
                        text2: 'Product items',
                        text3: productController.totalproduct.value.toString(),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
