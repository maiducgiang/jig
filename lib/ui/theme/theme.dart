import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/theme/constant.dart';


class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      backgroundColor: Colors.white,
      primaryColor: primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: contentColorLightTheme),
      fontFamily: "Montserrat",
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: contentColorLightTheme.withOpacity(0.7),
        unselectedItemColor: contentColorLightTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        showUnselectedLabels: true,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      backgroundColor: darkGreyClr,
      primaryColor: primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: contentColorLightTheme,
      iconTheme: const IconThemeData(color: contentColorDarkTheme),
      fontFamily: "Montserrat",
      colorScheme: const ColorScheme.dark().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: contentColorLightTheme,
        selectedItemColor: Colors.white70,
        unselectedItemColor: contentColorDarkTheme.withOpacity(0.32),
        selectedIconTheme: const IconThemeData(color: primaryColor),
        showUnselectedLabels: true,
      ),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}

InputDecoration get primaryIputDecoration {
  return InputDecoration(
    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
    fillColor: backgroundTextField,
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: textBody,
    suffixIcon: Icon(
      Icons.arrow_drop_down,
      size: 30.sp,
    ),
    floatingLabelStyle: textBody.copyWith(color: primaryColor),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(defaultBorderRadius)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(defaultBorderRadius)),
    contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 20.w, right: 0),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(defaultBorderRadius)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(defaultBorderRadius)),
  );
}

TextStyle get textBody {
  return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
      color: const Color(0xFF777777));
}
