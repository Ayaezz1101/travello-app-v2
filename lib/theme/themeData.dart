import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFF3951);
  static const Color secondaryColor = Color(0xFF929292);
  static const Color accentColor = Color(0xFF000000);
  static const Color lightPink = Color(0xFFFF7686);
  static const Color fieldGrey = Color(0x33C4C4C4);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Mulish',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w800,
          color: accentColor,
        ),
        displayMedium: TextStyle(
          fontSize: 26.sp,
          fontWeight: FontWeight.w300,
          color: secondaryColor,
        ),
        labelLarge: TextStyle(
          fontFamily: 'NicoMoji',
          fontSize: 48.sp,
          color: Colors.white,
        ),

        titleMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF252525),
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: const Color(0xFF252525),
        ),
        labelMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: accentColor,
        ),
        displaySmall: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w800,
          color: const Color(0xFF252525),
        ),
        titleLarge: TextStyle(
          fontFamily: 'raleway',
          fontSize: 36.sp,
          fontWeight: FontWeight.w700,
          color: accentColor,
        ),
      ),
    );
  }
}
