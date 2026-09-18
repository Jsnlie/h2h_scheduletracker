import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (Official Fan Color: Sky Blue)
  static const Color primary = Color(0xFF4FA8EA);
  static const Color primaryLight = Color(0xFFE3F2FD);
  static const Color primaryDark = Color(0xFF1976D2);

  // Soft Accents
  static const Color accentPink = Color(0xFFFF6584);
  static const Color accentPinkLight = Color(0xFFFCE4EC);
  static const Color accentPurple = Color(0xFF8E24AA);
  static const Color accentPurpleLight = Color(0xFFF3E5F5);

  // Neutral Background & Surface
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardSurface = Colors.white;
  static const Color border = Color(0xFFE2E8F0);

  // Text Colors
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textLight = Color(0xFF94A3B8);

  // Category Badge Colors
  static Color getCategoryBg(String category) {
    switch (category) {
      case 'Music Show':
        return const Color(0xFFFCE4EC);
      case 'Fansign':
        return const Color(0xFFE1F5FE);
      case 'Broadcast':
        return const Color(0xFFEDE7F6);
      default:
        return const Color(0xFFFFF3E0);
    }
  }

  static Color getCategoryTextColor(String category) {
    switch (category) {
      case 'Music Show':
        return const Color(0xFFD81B60);
      case 'Fansign':
        return const Color(0xFF0288D1);
      case 'Broadcast':
        return const Color(0xFF6A1B9A);
      default:
        return const Color(0xFFE65100);
    }
  }
}
