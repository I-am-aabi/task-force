import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/models/product_model.dart';
import 'package:test_1/views/home/inventory/widgets/view_product.dart';
import 'package:test_1/views/home/styles_constants.dart/colors.dart';
import 'package:test_1/views/home/styles_constants.dart/styles.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.product,
      required this.index,
      required this.istransaction});
  final Product product;
  final int index;
  final ProductController productController = Get.find();
  final bool istransaction;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          if (istransaction) {
            productController.select(product);
          } else {
            viewProduct(context);
            productController.select(product);
          }
        },
        child: Container(
          height: 90,
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
                        product.name,
                        style: TextStylesCollection.productNamestyle(),
                      ),
                      istransaction
                          ? FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                product.description,
                                style: TextStylesCollection
                                    .productDescriptionstyle(),
                              ),
                            )
                          : Text(
                              product.description,
                              style:
                                  TextStylesCollection.productDescriptionstyle(),
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
                      'price: ${product.price.toString()}',
                      style: TextStylesCollection.productPricestyle(),
                    ),
                    Text(
                      'stock: ${product.stock.toString()}',
                      style: TextStylesCollection.productStockstyle(),
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
