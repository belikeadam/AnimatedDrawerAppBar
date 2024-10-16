import 'package:flutter/material.dart';

class AppColors {
  // Primary and secondary colors
  static const Color primaryColor = Color(0xFFE91E63);  // Magenta-pink
  static const Color primaryVariantColor = Color(0xFFD81B60);  // A darker shade of magenta-pink
  static const Color secondaryColor = Color(0xFF004D40);  // Dark green
  static const Color secondaryVariantColor = Color(0xFF00332D);  // A darker shade of green
  static const Color backgroundColor = Colors.white;
  static const Color surfaceColor = Colors.white;
  static const Color errorColor = Color(0xFFB00020);
  static const Color highlightColor = Color(0xFFFFEB3B);  // Yellow color

  // WHATSAPP LINK
  static const String whatsappLink = 'https://wa.me/';

  // CURRENCY
  static const String currencySymbol = '\RM'; // Default currency symbol

  // BUTTONS
  static const Color appButtonColor = secondaryColor;  // Use secondaryColor for button background
  static const Color appButtonTextColor = Colors.white;  // Button text/icon color

  // Status colors
  static const Color pendingColor = Color(0xFFE91E63);
  static const Color completedColor = Color(0xFF4CAF50);  // Add this line

  static const Color snackbarErrorColor = Color(0xFFE91E63);
  static const Color snackbarSuccessfullColor = Color(0xFF4CAF50);  // Add this line

  static const Color onPrimaryColor = Colors.white;
  static const Color onSecondaryColor = Colors.black;
  static const Color onBackgroundColor = Colors.black;
  static const Color onSurfaceColor = Colors.black;
  static const Color onErrorColor = Colors.white;

  static const Color appBarColor = primaryColor;
  static const Color appBarTextColor = onPrimaryColor;
  static const Color appBarIconColor = onPrimaryColor;

  // New colors for modern UI
  static const Color createSupplierColor = Color(0xFF00796B);  // New color

  static const Color cardBackgroundColor = Colors.white;
  static const Color cardShadowColor = Color(0x1A000000);
  static const Color chartLineColor = primaryColor;
  static const Color chartGradientTopColor = Color(0x1A6200EE);
  static const Color chartGradientBottomColor = Color(0x006200EE);

  static const Color secondaryTextColor = Colors.grey;  // Added missing property

  // Added missing properties
  static const Color titleTextColor = Color(0xFF333333);  // Headings
  static const Color bodyTextColor = Color(0xFF666666);   // Body text
  static const Color labelTextColor = Color(0xFF888888);  // Form labels

  // New color for separator
  static const Color separatorColor = Color(0xFF333333);  // Darker color for separator
}