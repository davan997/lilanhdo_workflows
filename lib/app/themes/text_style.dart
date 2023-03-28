import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText {
  const StyleText._();

  static TextStyle inter12w500 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle interBold = GoogleFonts.inter(
    fontWeight: FontWeight.bold,
  );

  static TextStyle poppins18w600 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle poppins40w600 = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

  static TextStyle poppins40Bold = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
}
