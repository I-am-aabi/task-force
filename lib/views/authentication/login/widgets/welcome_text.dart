import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key, required this.heading, required this.discription});
  final String heading;
  final String discription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const SizedBox(
          height: 20,
        ),
        Text(
          heading,
          style:  GoogleFonts.poppins(fontSize: 38,),
        ),
        Text(
          discription,
          style:  GoogleFonts.poppins(
              fontSize: 20,  color: Colors.white),
        ),
      ],
    );
  }
}
