import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2D9D48);
  static const Color errorColor = Color(0xFFDC143C);
  static const Color warningColor = Color(0xFFFFA500);
  static const Color successColor = Color(0xFF27AE60);
  static const Color infoColor = Color(0xFF4A90E2);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF666666);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        error: errorColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
