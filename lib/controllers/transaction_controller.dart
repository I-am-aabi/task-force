import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/customer_controller.dart';
import 'package:test_1/controllers/product_data_controller.dart';
import 'package:test_1/controllers/product_text_controllers.dart';
import 'package:test_1/models/transaction_model.dart';
import 'package:uuid/uuid.dart';

class TransactionController extends GetxController {
  final CustomerController customerController = Get.put(CustomerController());
  final ProductController productController = Get.find();
  RxList transactionlist = [].obs;
  RxBool fetching = false.obs;
  final CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');
  CustomerTransaction? selectedTransaction;

  select(CustomerTransaction data) {
    selectedTransaction = data;
  }

  resetResult() {
    transactionlist.value = [];
    fetching.value = false;
  }

  @override
  onInit() async {
    // await fetchTransaction();
    super.onInit();
  }

  findtotal() {
    return int.parse(AppTextControllers.pricecontroller.text) *
        productController.selectedProduct!.price;
  }

  addTransaction() async {
    CustomerTransaction data = CustomerTransaction(
        id: const Uuid().v4(),
        count: int.parse(AppTextControllers.pricecontroller.text),
        name: customerController.selectedCostumer!.name,
        date: AppTextControllers.descriptioncontroller.text,
        amount: productController.selectedProduct!.price,
        parentid: customerController.selectedCostumer!.id,
        productid: productController.selectedProduct!.id,
        product: productController.selectedProduct!.name,
        total: findtotal());
    transactionCollection.doc().set(data.toJson());
    productController
        .decreaseStock()
        .then((value) => AppTextControllers.clear());

    await fetchTransaction();
  }

  fetchTransaction() async {
    final data = await transactionCollection
        .where('parentid', isEqualTo: customerController.selectedCostumer!.id)
        .get();
    List<CustomerTransaction> transactions = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return CustomerTransaction.fromJson(productData);
    }).toList();
    transactionlist.value = transactions;
    fetching.value = true;
  }

  Future<void> deleteDocumentByUid() async {
    try {
      QuerySnapshot querySnapshot = await transactionCollection
          .where('id', isEqualTo: selectedTransaction!.id)
          .get();

      for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
        await docSnapshot.reference.delete();
        await fetchTransaction();
      }
    } catch (e) {
      // print(e.toString());
      return;
    }
  }

  // Future<void> editDocumentByUid() async {
  //   CustomerTransaction data = CustomerTransaction(
  //       id: selectedTransaction!.id,
  //       uid: 'asdf',
  //       name: AppTextControllers.namecontroller.text,
  //       date: AppTextControllers.descriptioncontroller.text,
  //       amount: int.parse(AppTextControllers.pricecontroller.text));
  //   try {
  //     QuerySnapshot querySnapshot = await transactionCollection
  //         .where('id', isEqualTo: selectedTransaction!.id)
  //         .get();

  //     for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
  //       await docSnapshot.reference.set(data.toJson());
  //       AppTextControllers.clear();
  //       await fetchTransaction();
  //     }
  //   } catch (e) {
  //     // print(e.toString());
  //     return;
  //   }
  // }
}
