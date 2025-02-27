import 'package:flutter/material.dart';

class AppColors {
  // Main brand colors
  static const Color primary = Color.fromRGBO(50, 32, 113, 1); // Deep purple
  static const Color primaryLight = Color.fromRGBO(84, 66, 147, 1); // Lighter purple
  static const Color primaryDark = Color.fromRGBO(32, 20, 75, 1); // Darker purple
  
  // Secondary colors
  static const Color secondary = Color.fromRGBO(69, 123, 157, 1); // Blue
  static const Color secondaryLight = Color.fromRGBO(104, 158, 192, 1); // Lighter blue
  static const Color secondaryDark = Color.fromRGBO(43, 76, 97, 1); // Darker blue
  
  // Accent colors
  static const Color accent = Color.fromRGBO(168, 132, 36, 1); // Gold/mustard
  static const Color accentLight = Color.fromRGBO(203, 167, 71, 1); // Lighter gold
  static const Color accentDark = Color.fromRGBO(133, 104, 28, 1); // Darker gold
  
  // Background colors
  static const Color background = Color.fromRGBO(236, 232, 219, 1); // Light beige
  static const Color surface = Color.fromRGBO(252, 250, 242, 1); // Lighter beige
  static const Color card = Color.fromRGBO(255, 255, 255, 1); // White for cards
  
  // Text colors
  static const Color text = Color.fromRGBO(33, 33, 33, 1); // Near black
  static const Color textLight = Color.fromRGBO(117, 117, 117, 1); // Gray
  static const Color textOnPrimary = Color.fromRGBO(255, 255, 255, 1); // White text on primary
  static const Color textOnSecondary = Color.fromRGBO(255, 255, 255, 1); // White text on secondary
  
  // Utility colors
  static const Color success = Color.fromRGBO(76, 175, 80, 1); // Green
  static const Color warning = Color.fromRGBO(255, 152, 0, 1); // Amber
  static const Color error = Color.fromRGBO(211, 47, 47, 1); // Red
  static const Color info = Color.fromRGBO(3, 169, 244, 1); // Light blue
  
  // Dividers and borders
  static const Color divider = Color.fromRGBO(189, 189, 189, 0.2);
  static const Color border = Color.fromRGBO(224, 224, 224, 1);
  
  // Gradient colors for special elements
  static final List<Color> primaryGradient = [
    primary,
    Color.fromRGBO(69, 50, 135, 1),
  ];
  
  static final List<Color> accentGradient = [
    accent,
    Color.fromRGBO(191, 155, 48, 1),
  ];
}