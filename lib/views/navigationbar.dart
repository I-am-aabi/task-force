import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/page_index_controller.dart';
import 'package:test_1/views/customers/customers_page.dart';
import 'package:test_1/views/dashboard/dashboad_page.dart';
import 'package:test_1/views/inventory/inventory_page.dart';
import 'package:test_1/views/sale_reports/sales_reports_page.dart';


class Navbar extends StatelessWidget {
  Navbar({super.key});
  final pagelist = [
     DashboardPage(),
     InventoryPage(),
     CustomersPage(),
    const SalesReportsPage()
  ];
  final PageIndexController pagecontroller = Get.put(PageIndexController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
              child: pagelist.elementAt(pagecontroller.pageIndex.value)),
          bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.dashboard,), label: 'Dashboard',
                  selectedIcon: Icon(Icons.dashboard,color: Colors.black,),),
              NavigationDestination(
                  icon: Icon(Icons.inventory), label: 'Inventory',
                  selectedIcon: Icon(Icons.inventory,color: Colors.black,),),
              NavigationDestination(
                  icon: Icon(Icons.auto_graph), label: 'Customers',
                  selectedIcon: Icon(Icons.auto_graph,color: Colors.black,),),
              NavigationDestination(
                  icon: Icon(Icons.event_note), label: 'Reports',
                  selectedIcon: Icon(Icons.event_note,color: Colors.black,),),
            ],
            indicatorColor: Colors.blueAccent,
            selectedIndex: pagecontroller.pageIndex.value,
            elevation: 3,
            height: 70,
            // surfaceTintColor: Colors.red,
            onDestinationSelected: (index) =>
                pagecontroller.pageIndex.value = index,
          ),
        ));
  }
}
