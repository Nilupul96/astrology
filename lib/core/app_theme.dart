import 'package:astrology/core/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Montserrat',
      useMaterial3: true,
      iconTheme: IconThemeData(color: AppColors.black),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp)),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(backgroundColor: AppColors.black),
      textTheme: TextTheme(
          displayLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              fontSize: 24.sp),
          displayMedium: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              fontSize: 16.sp),
          displaySmall: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.white,
              fontSize: 14.sp)),
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Colors.white,
      ),
      canvasColor: AppColors.lightPurple,
      dropdownMenuTheme: DropdownMenuThemeData(),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.transparent,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryYellow)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.grey)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.red))));

  static TextTheme textTheme() => TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, color: AppColors.white, fontSize: 24.sp),
      displayMedium: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 16.sp, color: AppColors.white),
      displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
          color: AppColors.white));

  static AppBarTheme appBarTheme() => AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.white),
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.white,
          fontSize: 24.sp));
}
