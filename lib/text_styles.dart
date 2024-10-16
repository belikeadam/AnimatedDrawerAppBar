import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTextStyles {
  // Heading Styles
  static final TextStyle heading1 = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.titleTextColor,  // Clear semantic color for headings
  );

  static final TextStyle heading2 = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.titleTextColor,
  );

  // Body Text Styles
  static final TextStyle body1 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyTextColor,  // Descriptive body text color
  );

  static final TextStyle body2 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.bodyTextColor,
  );

  // Button Text Style
  static final TextStyle button = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.appButtonTextColor,  // Matches button text color
  );

  // AppBar Title Style
  static final TextStyle appBarTitle = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.onPrimaryColor,  // Consistent with app bar text color
  );

  // Form Label Text Style
  static final TextStyle formLabel = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.labelTextColor,  // For form labels
  );

  // New style for supplier name
  static final TextStyle supplierName = GoogleFonts.roboto(
    fontSize: 12, // Smaller font size
    fontWeight: FontWeight.w500, // Medium weight
    color: AppColors.onBackgroundColor,
  );

  // New style for supplier total purchase count
  static final TextStyle supplierPurchaseCount = GoogleFonts.roboto(
    fontSize: 14, // Smaller font size
    fontWeight: FontWeight.w500, // Medium weight
    color: AppColors.onBackgroundColor,
  );

  // New style for supplier total purchase amount
  static final TextStyle supplierTotalPurchaseAmount = GoogleFonts.roboto(
    fontSize: 14, // Smaller font size
    fontWeight: FontWeight.bold, // Bold weight
    color: AppColors.onBackgroundColor,
  );

  // New styles for modern UI
  static final TextStyle cardTitle = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final TextStyle cardValue = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle cardLabel = GoogleFonts.roboto(
    fontSize: 14,
    color: Colors.white70,
  );

  // Added missing property
  static final TextStyle caption = GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.secondaryTextColor,
  );
}