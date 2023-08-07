import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: 280,
            width: 280,
            child: Lottie.asset('assets/animations/loadingdark.json')));
    
  }
}
