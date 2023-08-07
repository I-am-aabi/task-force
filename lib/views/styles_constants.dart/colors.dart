import 'package:flutter/material.dart';

class AppColors {
  static Color colorcyan = Colors.cyanAccent;
  static Color coloryellow = Colors.yellowAccent;
  static Color colorgreen = Colors.greenAccent;
  static Color colorred = Colors.redAccent;
  static Color popupBackground = Colors.black;
  static getcolor(int index) {
    if (index % 4 == 0) {
      return colorcyan;
    } else if (index % 4 == 1) {
      return coloryellow;
    } else if (index % 4 == 2) {
      return colorgreen;
    } else {
      return colorred;
    }
  }
}
