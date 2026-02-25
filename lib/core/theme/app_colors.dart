import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF6C63FF);
  static const Color secondary = Color(0xFF4FACFE);

  static const Color scaffold = Color(0xFFF6F7FB);
  static const Color card = Color(0xFFFFFFFF);

  static const LinearGradient headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFB993FF), Color(0xFF6C63FF)],
  );

  static const LinearGradient bottomNavGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF635BFF), Color(0xFF4C40C3)],
  );

  static const LinearGradient watchlistGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4FACFE), Color(0xFFB993FF)],
  );

  static const Color buy = Color(0xFF2979FF);
  static const Color sell = Color(0xFFE53935);

  static const Color positive = Color(0xFF00C853);
  static const Color negative = Color(0xFFD32F2F);
  static const Color tabSelected = Color(0xFF6C63FF);
  static const Color tabUnselected = Color(0xFFE0E0E0);

  static const Color textPrimary = Color(0xFF1F1F1F);
  static const Color textSecondary = Color(0xFF8A8A8A);
  static const Color textOnPrimary = Colors.white;

  static const Color iconGrey = Color(0xFF9E9E9E);
  static const Color divider = Color(0xFFECECEC);

  static const Color searchBackground = Color(0xFFF1F2F6);
  static const Color searchBorder = Color(0xFFE0E0E0);
}
