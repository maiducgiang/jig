import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jig/ui/theme/constant.dart';

class SelectSocialNetworking extends StatelessWidget {
  const SelectSocialNetworking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52.h,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Icon(Ionicons.ios_logo_facebook,
                size: 24.sp, color: const Color(0xff1877F2)),
          ),
          SizedBox(
            width: defaultPaddingScreen,
          ),
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Icon(Ionicons.logo_google,
                size: 24.sp, color: const Color(0xff1877F2)),
          ),
          SizedBox(
            width: defaultPaddingScreen,
          ),
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Icon(Ionicons.ios_logo_facebook,
                size: 24.sp, color: const Color(0xff1877F2)),
          ),
          SizedBox(
            width: defaultPaddingScreen,
          ),
          Container(
            width: 46.w,
            height: 46.w,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultBorderRadius)),
            child: Icon(Ionicons.logo_google,
                size: 24.sp, color: const Color(0xff1877F2)),
          ),
        ],
      ),
    );
  }
}
