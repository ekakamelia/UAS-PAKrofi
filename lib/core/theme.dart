import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Deep Red / Maroon from the screenshots
  static const Color primary = Color(0xFFA83232); 
  static const Color primaryDark = Color(0xFF802020);
  static const Color background = Color(0xFFF5F5F5); // Light grey background
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color white = Colors.white;
  static const Color grey = Color(0xFFE0E0E0);
  static const Color green = Color(0xFF4CAF50); // For progress bars
}

class AppTextStyles {
  static TextStyle get header => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      );

  static TextStyle get title => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get subtitle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );

  static TextStyle get body => GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textPrimary,
      );

  static TextStyle get button => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      );
  
  static TextStyle get logoText => GoogleFonts.poppins( // Assuming a font for the logo text if not image
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
  );
}
