import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';
import 'package:test_1/views/home/inventory/widgets/product_card.dart';
import 'package:test_1/views/home/styles_constants.dart/styles.dart';
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/nodata_animation.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.arrow_back)),
                    ),
                    Expanded(
                        child: TextField(
                      controller: AppTextControllers.searchcontroller,
                      onChanged: (value) async =>
                          await productController.searchProducts(),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Result',
                style: TextStylesCollection.headingstyle(),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: Obx(() {
                if (productController.productlist.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ProductCard(
                          product: productController.productlist[index],
                          index: index,
                          istransaction: false);
                    },
                    itemCount: productController.productlist.length,
                  );
                } else {
                  return const NodataAnimation();
                }
              }))
            ],
          ),
        ),
      )),
    );
  }
}
