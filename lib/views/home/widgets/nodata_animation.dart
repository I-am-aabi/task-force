import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NodataAnimation extends StatelessWidget {
  const NodataAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 280,
            width: 280,
            child: Column(
              children: [
                Lottie.asset('assets/animations/nodatadark.json'),
                const Text(
                  'Try adding a new data',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                )
              ],
            )));
  }
}
