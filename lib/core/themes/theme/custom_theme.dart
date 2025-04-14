import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:parking_controller/core/const/app_const.dart';
import 'package:parking_controller/core/themes/colors/colors.dart';
import 'package:parking_controller/core/utils/functions/get_hight.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightColors.backgroundColor,
  primaryColor: LightColors.primaryColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.light().copyWith(
    primaryContainer: LightColors.containerColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontFamily: kFontFamily,
      color: LightColors.textColor,
    ),
    bodySmall: TextStyle(
      fontFamily: kFontFamily,
      color: LightColors.text2Color,
    ),
  ),
  iconTheme: const IconThemeData(color: LightColors.textColor),
  appBarTheme: AppBarTheme(
    centerTitle: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: LightColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    backgroundColor: LightColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: LightColors.textColor,
      fontFamily: kFontFamily,
      fontSize: 20.sp,
      height: getTextHeight(20, 24.2),
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: const BorderSide(color: LightColors.primaryColor),
      ),
      textStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        height: getTextHeight(16, 19.36),
        color: LightColors.backgroundColor,
      ),
      fixedSize: Size(double.maxFinite, 54.h),
      foregroundColor: Colors.white,
    ),
  ),
);

///
///
///dark theme
///
///
///
ThemeData darkTheme = ThemeData(
  fontFamily: kFontFamily,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkColors.backgroundColor,
  bottomAppBarTheme: const BottomAppBarTheme(),
  iconTheme: const IconThemeData(color: DarkColors.textColor),
  primaryColor: DarkColors.primaryColor,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark().copyWith(
    primaryContainer: DarkColors.containerColor,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontFamily: kFontFamily, color: DarkColors.textColor),
    bodySmall: TextStyle(fontFamily: kFontFamily, color: DarkColors.text2Color),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: DarkColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: DarkColors.backgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: kFontFamily,
      color: DarkColors.textColor,
      fontSize: 20.sp,
      height: getTextHeight(20, 24.2),
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(color: DarkColors.textColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: const BorderSide(color: DarkColors.primaryColor),
      ),
      textStyle: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        height: getTextHeight(16, 19.36),
        color: DarkColors.textColor,
      ),
      fixedSize: Size(double.maxFinite, 54.h),
      foregroundColor: Colors.white,
    ),
  ),
);
