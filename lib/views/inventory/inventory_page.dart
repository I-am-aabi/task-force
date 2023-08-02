import 'package:flutter/material.dart';
import 'package:test_1/views/styles_constants.dart/styles.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inventory',style: TextStylesCollection.headingstyle,)
          ],
        ),
    
    
    
      ),
    );
  }
}
