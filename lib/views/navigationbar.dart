import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controllers/page_index_controller.dart';
import 'package:test_1/views/dashboard/dashboad_page.dart';
import 'package:test_1/views/inventory/inventory_page.dart';
import 'package:test_1/views/sale_reports/sales_reports_page.dart';
import 'package:test_1/views/sales/sales_page.dart';

class Navbar extends StatelessWidget {
  Navbar({super.key});
  final pagelist = [
    const DashboardPage(),
    const InventoryPage(),
    const SalesPage(),
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
                  icon: Icon(Icons.dashboard), label: 'Dashboard'),
              NavigationDestination(
                  icon: Icon(Icons.inventory), label: 'Inventory'),
              NavigationDestination(
                  icon: Icon(Icons.auto_graph), label: 'Sales'),
              NavigationDestination(
                  icon: Icon(Icons.event_note), label: 'Reports'),
            ],
            indicatorColor: Colors.purple.shade300,
            selectedIndex: pagecontroller.pageIndex.value,
            onDestinationSelected: (index) =>
                pagecontroller.pageIndex.value = index,
          ),
        ));
  }
}
