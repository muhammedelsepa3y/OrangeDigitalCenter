import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';

import '../../views/constancts/app_color.dart';

class AppTitle extends StatelessWidget {
  double fontSize = 20.sp;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Orange ',
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: AppColor.primaryColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Digital Center',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
