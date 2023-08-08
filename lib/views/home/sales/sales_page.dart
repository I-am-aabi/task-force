import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/customer_controller.dart';
import 'package:test_1/controllers/home/pdf_controller.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';

import 'package:test_1/controllers/home/transaction_controller.dart';
import 'package:test_1/views/home/sale_reports/widgets/pdf_view_page.dart';
import 'package:test_1/views/home/sales/widgets/add_transaction.dart';
import 'package:test_1/views/home/sales/widgets/delete_customer.dart';
import 'package:test_1/views/home/sales/widgets/edit_customer.dart';
import 'package:test_1/views/home/sales/widgets/transaction_card.dart';
import 'package:test_1/views/home/styles_constants.dart/styles.dart';
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/nodata_animation.dart';

class CustomerSalesPage extends StatelessWidget {
  CustomerSalesPage({super.key});
  final CustomerController customerController = Get.find();
  final TransactionController transactionController = Get.find();
  final ProductController productController = Get.find();
  final PdfController pdfController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          customerController.selectedCostumer!.name,
                          style: TextStylesCollection.headingstyle(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  pdfController.generateAllTransactionReport(
                                      transactionController.transactionlist);
                                  Get.to(() => PdfViewPage());
                                },
                                icon: const Icon(Icons.event_note)),
                            IconButton(
                                onPressed: () {
                                  AppTextControllers.presetCustomer(
                                      customerController.selectedCostumer!);
                                  editCustomer(context);
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  deleteCustomer(context);
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('address:'),
                        Text(customerController.selectedCostumer!.adress)
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('phone:'),
                        Text(customerController.selectedCostumer!.phone
                            .toString())
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: Obx(
                    () {
                      if (!transactionController.fetching.value) {
                        return const LoadingAnimation();
                      } else {
                        if (transactionController.transactionlist.isEmpty) {
                          return const NodataAnimation();
                        } else {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return TransactionCard(
                                  sale: transactionController
                                      .transactionlist[index],
                                  index: index);
                            },
                            itemCount:
                                transactionController.transactionlist.length,
                          );
                        }
                      }
                    },
                  )),
                ],
              ),
              Positioned(
                  bottom: 5,
                  right: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Card(
                      elevation: 3,
                      shape: const CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        maxRadius: 25,
                        child: IconButton(
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            AppTextControllers.clear();
                            productController.resetselectedProductname();
                            addTransaction(context);
                          },
                        ),
                      ),
                    ),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
