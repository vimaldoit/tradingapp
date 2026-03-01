import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF4FACFE);

  static const Color scaffold = Color(0xFFF5F1FF);
  static const Color card = Color(0xFFFFFFFF);

  static LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF436EDD).withOpacity(0.5), // 50% opacity
      Color(0xFFAF7CE3).withOpacity(0.5),
      Color(0xFFAF69C7).withOpacity(0.5),
    ],
  );

  static const LinearGradient bottomNavGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF6768E1), Color(0xFF4A419C)],
  );

  static const LinearGradient watchlistGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF436EDD), Color(0xFFAF7CE3), Color(0xFFAF69C7)],
  );

  static const Color chartbuttomText = Color(0xffAC876C);
  static const Color buy = Color(0xFF256EFD);
  static const Color sell = Color(0xFFFF0000);

  static const Color positive = Color(0xFF256EFD);
  static const Color negative = Color(0xFFFF0000);
  static const Color tabSelected = Color(0xFF6C63FF);
  static const Color tabUnselected = Color(0xFFE0E0E0);

  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF8A8A8A);
  static const Color textOnPrimary = Colors.white;

  static const Color iconGrey = Color(0xFFC9C9C9);
  static const Color divider = Color(0xFFDADADA);

  static const Color searchBackground = Color(0xFFFFFFFF);
  static const Color searchBorder = Color(0xFFDADADA);

  static const Color hintColor = Color(0xFFDFE2E4);
  static const LinearGradient activeTabGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF436EDD), Color(0xFFAF7CE3), Color(0xFFAF69C7)],
  );
}
