import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class InfoDeviceScreen extends StatefulWidget {
  const InfoDeviceScreen({super.key});

  @override
  State<InfoDeviceScreen> createState() => _InfoDeviceScreenState();
}

class _InfoDeviceScreenState extends State<InfoDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(
      title: "THÔNG TIN THIẾT BỊ",
      child: Column(
        children: [
          // SizedBox(
          //   height: defaultPaddingScreen * 2,
          // ),
          // Text(
          //   ,
          //   style: primaryHeaderTitleStyle.copyWith(color: Colors.black),
          // ),
          // SizedBox(
          //   height: defaultPaddingScreen * 2,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260.h,
                child: Text(
                  "Model:",
                  style: primaryTitleStyle.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 600.h,
                child: Text(
                  "Model 1234abc",
                  style: primaryTitleStyle.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(
            height: defaultPaddingScreen,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260.h,
                child: Text(
                  "Firmware:",
                  style: primaryTitleStyle.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 600.h,
                child: Text(
                  "Firmware version 123456",
                  style: primaryTitleStyle.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
