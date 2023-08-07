import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/date_controller.dart';
import 'package:test_1/controllers/pdf_controller.dart';
import 'package:test_1/controllers/product_text_controllers.dart';
import 'package:test_1/controllers/transaction_controller.dart';
import 'package:test_1/models/product_model.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {
  //  final TransactionController transactionController = Get.put(TransactionController());
  // final DateController dateController = Get.put(DateController());
  // final PdfController storageController = Get.put(PdfController());
  RxList productlist = [].obs;
  RxBool fetching = false.obs;
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');
  Product? selectedProduct;
  RxString productname = 'Select a product'.obs;
  select(Product data) {
    selectedProduct = data;
    productname.value = data.name;
  }

  @override
  onInit() {
    fetchproducts();
    super.onInit();
  }

  resetselectedProductname() {
    productname.value = 'Select a product';
  }

  addProduct() async {
    Product data = Product(
        id: const Uuid().v4(),
        uid: 'asdf',
        name: AppTextControllers.namecontroller.text,
        description: AppTextControllers.descriptioncontroller.text,
        stock: int.parse(AppTextControllers.stockcontroller.text),
        price: int.parse(AppTextControllers.pricecontroller.text));
    productCollection.doc().set(data.toJson());
    AppTextControllers.clear();
    await fetchproducts();
  }

  fetchproducts() async {
    final data = await productCollection.where('uid', isEqualTo: 'asdf').get();
    List<Product> productsList = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return Product.fromJson(productData);
    }).toList();
    productlist.value = productsList;
    fetching.value = true;
  }

  Future<void> deleteDocumentByUid() async {
    try {
      QuerySnapshot querySnapshot = await productCollection
          .where('id', isEqualTo: selectedProduct!.id)
          .get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        await docSnapshot.reference.delete();
        await fetchproducts();
      }
    } catch (e) {
      // print(e.toString());
      return;
    }
  }

  Future<void> editDocumentByUid() async {
    Product data = Product(
        id: selectedProduct!.id,
        uid: 'asdf',
        name: AppTextControllers.namecontroller.text,
        description: AppTextControllers.descriptioncontroller.text,
        stock: int.parse(AppTextControllers.stockcontroller.text),
        price: int.parse(AppTextControllers.pricecontroller.text));
    try {
      QuerySnapshot querySnapshot = await productCollection
          .where('id', isEqualTo: selectedProduct!.id)
          .get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        await docSnapshot.reference.update(data.toJson());
        await fetchproducts();
      }
    } catch (e) {
      // print(e.toString());
      return;
    }
  }

  Future<void> decreaseStock() async {
    QuerySnapshot querySnapshot = await productCollection
        .where('id', isEqualTo: selectedProduct!.id)
        .get();
    int currentStock = selectedProduct!.stock;
    // print(AppTextControllers.pricecontroller.text);
    int count = int.parse(AppTextControllers.pricecontroller.text);
    int stock = currentStock - count;
    for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
      await docSnapshot.reference.update({'stock': stock});
      await fetchproducts();
    }
  }

  Future<void> increaseStock() async {
    QuerySnapshot querySnapshot = await productCollection
        .where('id', isEqualTo: selectedProduct!.id)
        .get();
    int count = selectedProduct!.stock;
    print(AppTextControllers.pricecontroller.text);
    int currentStock = int.parse(AppTextControllers.pricecontroller.text);
    print(currentStock);
    int stock = count + currentStock;

    for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
      await docSnapshot.reference.update({'stock': stock});
      await fetchproducts();
    }
  }
}
