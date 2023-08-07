import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/customer_controller.dart';
import 'package:test_1/views/customers/widgets/add_customer.dart';
import 'package:test_1/views/customers/widgets/customer_card.dart';
import 'package:test_1/views/styles_constants.dart/styles.dart';
import 'package:test_1/views/widgets/loading_animation.dart';
import 'package:test_1/views/widgets/nodata_animation.dart';

class CustomersPage extends StatelessWidget {
  CustomersPage({super.key});
  final CustomerController customerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customers',
                  style: TextStylesCollection.headingstyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: Obx(
                  () {
                    if (!customerController.fetching.value) {
                      return const LoadingAnimation();
                    } else {
                      if (customerController.customerlist.isEmpty) {
                        return const NodataAnimation();
                      } else {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return CustomerCard(
                                customer:
                                    customerController.customerlist[index],
                                index: index);
                          },
                          itemCount: customerController.customerlist.length,
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
                      backgroundColor: Colors.black,
                      maxRadius: 25,
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                        onPressed: () {
                          addCustomer(context);
                          // addPopup(context);
                        },
                      ),
                    ),
                  ),
                )),
          ])),
    );
  }
}
