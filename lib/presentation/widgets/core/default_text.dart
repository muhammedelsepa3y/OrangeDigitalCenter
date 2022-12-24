import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatelessWidget {
  String text;
  Color? textColor;
  double? fontSize;

  DefaultText({
    required this.text,
    this.textColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: textColor,
      )),
    );
  }
}
