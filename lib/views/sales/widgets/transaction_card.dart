import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/transaction_controller.dart';
import 'package:test_1/models/transaction_model.dart';
import 'package:test_1/views/styles_constants.dart/colors.dart';
import 'package:test_1/views/styles_constants.dart/styles.dart';

class TransactionCard extends StatelessWidget {
  TransactionCard({super.key, required this.sale, required this.index});
  final CustomerTransaction sale;
  final int index;
  final TransactionController transactionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          // viewTransaction(context);
          transactionController.select(sale);
        },
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.getcolor(index),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        sale.product,
                        style: TextStylesCollection.productNamestyle,
                      ),
                      Text(
                        sale.date,
                        style: TextStylesCollection.productDescriptionstyle,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${sale.amount}x${sale.count}',
                      style: TextStylesCollection.productPricestyle,
                    ),
                    Text(
                      'Total:${sale.total.toString()}',
                      style: TextStylesCollection.productPricestyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
