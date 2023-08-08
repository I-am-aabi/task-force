import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStylesCollection {
  static TextStyle headingstyle() {
    return GoogleFonts.poppins(
      fontSize: 23,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle productNamestyle() {
    return GoogleFonts.poppins(
        fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black);
  }

  static TextStyle productDescriptionstyle() {
    return GoogleFonts.poppins(
        fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black);
  }

  static TextStyle productPricestyle() {
    return GoogleFonts.poppins(
        fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black);
  }

  static TextStyle productStockstyle() {
    return GoogleFonts.poppins(
        fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black);
  }

  static TextStyle salePricestyle() {
    return GoogleFonts.poppins(
        fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black);
  }

  static TextStyle customerName() {
    return GoogleFonts.poppins(
        fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black);
  }
}
