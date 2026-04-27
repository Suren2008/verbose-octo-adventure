import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF2BB673);
  static const Color primaryDark = Color(0xFF1F8A56);
  static const Color accent = Color(0xFFFF8A4C);

  static const Color calories = Color(0xFFF59E0B);
  static const Color protein = Color(0xFF3B82F6);
  static const Color fat = Color(0xFFEC4899);
  static const Color carbs = Color(0xFF10B981);

  static const Color lightSurface = Color(0xFFF7F8FA);
  static const Color darkSurface = Color(0xFF0F1115);
  static const Color darkCard = Color(0xFF1A1D24);
}

class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.lightSurface,
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF111827),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF111827)),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: AppColors.primary,
        labelStyle: const TextStyle(fontWeight: FontWeight.w500),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xFF9CA3AF),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      dividerColor: const Color(0xFFE5E7EB),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.darkCard,
      ),
      scaffoldBackgroundColor: AppColors.darkSurface,
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.darkCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkCard,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        hintStyle: const TextStyle(color: Color(0xFF6B7280)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.darkCard,
        selectedColor: AppColors.primary,
        labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkCard,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Color(0xFF6B7280),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      dividerColor: const Color(0xFF2A2F39),
    );
  }
}
