import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';

import 'package:test_1/views/home/inventory/widgets/add_product_screen.dart';
import 'package:test_1/views/home/inventory/widgets/product_card.dart';
import 'package:test_1/views/home/inventory/widgets/search_page.dart';
import 'package:test_1/views/home/styles_constants.dart/styles.dart';
import 'package:test_1/views/home/widgets/loading_animation.dart';
import 'package:test_1/views/home/widgets/nodata_animation.dart';

class InventoryPage extends StatelessWidget {
  InventoryPage({super.key});
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Inventory',
                      style: TextStylesCollection.headingstyle(),
                    ),
                    IconButton(onPressed: ()=>  Get.to(()=>  SearchPage()), icon: const Icon(Icons.search))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: Obx(
                () {
                  if (!productController.fetching.value) {
                    return const LoadingAnimation();
                  } else {
                    if (productController.productlist.isEmpty) {
                      return const NodataAnimation();
                    } else {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return ProductCard(
                              product: productController.productlist[index],
                              istransaction: false,
                              index: index);
                        },
                        itemCount: productController.productlist.length,
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
                        addPopup(context);
                      },
                    ),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}
