import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/home/customer_controller.dart';
import 'package:test_1/controllers/home/date_controller.dart';
import 'package:test_1/controllers/home/product_data_controller.dart';
import 'package:test_1/controllers/home/product_text_controllers.dart';

import 'package:test_1/models/transaction_model.dart';
import 'package:test_1/views/home/inventory/widgets/stock_empty.dart';
import 'package:uuid/uuid.dart';

class TransactionController extends GetxController {
  final CustomerController customerController = Get.put(CustomerController());
  final ProductController productController = Get.find();
  final DateController dateController = Get.find();
  RxList transactionlist = [].obs;
  RxBool fetching = false.obs;
  final CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');
  CustomerTransaction? selectedTransaction;
  User? user = FirebaseAuth.instance.currentUser;
  RxInt totaltransaction = 0.obs;
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
    await fetchAllTransaction();
    totaltransaction.value = transactionlist.length;

    super.onInit();
  }

  findtotal() {
    return int.parse(AppTextControllers.pricecontroller.text) *
        productController.selectedProduct!.price;
  }

  addTransaction(BuildContext context) async {
    int count = int.parse(AppTextControllers.pricecontroller.text);
    CustomerTransaction data = CustomerTransaction(
        id: const Uuid().v4(),
        count: count,
        name: customerController.selectedCostumer!.name,
        date: AppTextControllers.descriptioncontroller.text,
        amount: productController.selectedProduct!.price,
        parentid: customerController.selectedCostumer!.id,
        uid: user!.uid,
        product: productController.selectedProduct!.name,
        total: findtotal());
    if ((productController.selectedProduct!.stock - count) < 0) {
      emptyStock(context);
      return;
    }
    transactionCollection.doc().set(data.toJson());
    productController
        .decreaseStock()
        .then((value) => AppTextControllers.clear());
    await fetchTransaction();
  }

  fetchTransaction() async {
    final data = await transactionCollection
        .where('parentid', isEqualTo: customerController.selectedCostumer!.id)
        .where('uid', isEqualTo: user!.uid)
        .get();
    List<CustomerTransaction> transactions = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return CustomerTransaction.fromJson(productData);
    }).toList();
    transactionlist.value = transactions;
    fetching.value = true;
  }

  fetchTransactionbyname() async {
    final data = await transactionCollection
        .where('product', isEqualTo: productController.productname.value)
        .where('uid', isEqualTo: user!.uid)
        .get();
    List<CustomerTransaction> transactions = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return CustomerTransaction.fromJson(productData);
    }).toList();
    transactionlist.value = transactions;
    fetching.value = true;
  }

  fetchAllTransaction() async {
    final data =
        await transactionCollection.where('uid', isEqualTo: user!.uid).get();
    List<CustomerTransaction> transactions = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return CustomerTransaction.fromJson(productData);
    }).toList();
    transactionlist.value = transactions;
    fetching.value = true;
  }

  fetchTransactionbydate() async {
    final data = await transactionCollection
        .where('date', isEqualTo: dateController.date.value)
        .where('uid', isEqualTo: user!.uid)
        .get();
    List<CustomerTransaction> transactions = data.docs.map((e) {
      Map<String, dynamic> productData =
          e.data() as Map<String, dynamic>; // Add the 'as' cast here
      return CustomerTransaction.fromJson(productData);
    }).toList();
    transactionlist.value = transactions;
    fetching.value = true;
  }

  fetchTransactionbycustomer() async {
    final data = await transactionCollection
        .where('parentid', isEqualTo: customerController.selectedCostumer!.id)
        .where('uid', isEqualTo: user!.uid)
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
}
