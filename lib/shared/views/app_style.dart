import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double fontSize, Color color, FontWeight fw, [double? ht]) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color,
    fontWeight: fw,
    height: ht,
  );
}
