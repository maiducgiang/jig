import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/theme/constant.dart';

TextStyle get primaryHeaderTitleStyle {
  return TextStyle(
      fontSize: 32.sp,
      color: primaryColor,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
      height: 1.3);
}

TextStyle get primaryTitleStyle {
  return TextStyle(
      fontSize: 22.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      height: 1.3);
}

TextStyle get primaryContentStyle {
  return TextStyle(
      fontSize: 14.sp, color: contentColor, fontWeight: FontWeight.w400);
}

TextStyle get primarySubTitleStyle {
  return TextStyle(
      fontSize: 12.sp, color: Colors.grey[500], fontWeight: FontWeight.w400);
}

TextStyle get primaryTitleHeaderStyle {
  return TextStyle(
      fontSize: 15.sp, color: contentColor, fontWeight: FontWeight.w500);
}
