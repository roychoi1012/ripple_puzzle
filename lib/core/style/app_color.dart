import 'package:flutter/material.dart';

class AppColor {
  // ==================== NATURAL COLORS ====================
  
  static const Color black = Color(0xFF000000);
  static const Color gray1 = Color(0xFF1E293B);
  static const Color gray2 = Color(0xFF475569);
  static const Color gray3 = Color(0xFFA9A9A9);
  static const Color gray4 = Color(0xFFD9D9D9);
  static const Color white = Color(0xFFFFFFFF);
  
  // ==================== PRIMARY COLORS ====================
  
  static const Color primary100 = Color(0xFF1E40AF);
  static const Color primary80 = Color(0xFF4059C7);
  static const Color primary60 = Color(0xFF7384E0);
  static const Color primary40 = Color(0xFFAAB3F3);
  static const Color primary20 = Color(0xFFDEE3FF);
  
  // ==================== SECONDARY COLORS ====================
  
  static const Color secondary100 = Color(0xFF166534);
  static const Color secondary80 = Color(0xFF2F7C4A);
  static const Color secondary60 = Color(0xFF7DF0E3);
  static const Color secondary40 = Color(0xFF96C8A3);
  static const Color secondary20 = Color(0xFFD7F0E3);
  
  // ==================== TEXT COLORS ====================
  
  static const Color textBlue = Color(0xFF60A5FA);
  static const Color textSkyBlue = Color(0xFF22D3EE);
  static const Color textLightGreen = Color(0xFF4ADE80);
  static const Color textLavender = Color(0xFFC084FC);
  static const Color textSkyBlue2 = Color(0xFF22D3EE);
  
  // ==================== ACCENT COLORS ====================
  
  static const Color yellow = Color(0xFFFACC15);
  
  // ==================== OPACITY VARIANTS ====================
  
  // Primary with opacity
  static Color primary100WithOpacity(double opacity) => primary100.withOpacity(opacity);
  static Color primary80WithOpacity(double opacity) => primary80.withOpacity(opacity);
  
  // Black with opacity for overlays
  static Color blackWithOpacity(double opacity) => black.withOpacity(opacity);
  static Color whiteWithOpacity(double opacity) => white.withOpacity(opacity);
  
  // Common opacity values
  static final Color overlay = blackWithOpacity(0.5);
  static final Color backdropOverlay = blackWithOpacity(0.3);
  static final Color shimmer = whiteWithOpacity(0.1);
  
  // ==================== GRADIENTS ====================
  
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary100, primary60],
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary100, secondary60],
  );
  
  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary100, secondary80],
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [white, gray4],
  );
}