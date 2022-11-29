import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

import '../../../../../data/enum/enum_test_status.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(
      title: "KẾT NỐI BLUETOOTH, WIFI",
      resultStatus: ResultStatus.pass,
      child: Column(
        children: [
          // SizedBox(
          //   height: defaultPaddingScreen * 2,
          // ),
          // Text(
          //   "KẾT NỐI BLUETOOTH, WIFI",
          //   style: primaryHeaderTitleStyle.copyWith(color: Colors.black),
          // ),
          // SizedBox(
          //   height: defaultPaddingScreen * 2,
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 260.w,
                child: Text(
                  "Wi-Fi:",
                  style: primaryTitleStyle.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 300.w,
                child: Text(
                  "Kết nối thành công",
                  style: primaryTitleStyle.copyWith(color: primaryColor3),
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
                width: 260.w,
                child: Text(
                  "Bluetooth:",
                  style: primaryTitleStyle.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 300.w,
                child: Text(
                  "Kết nối thành công",
                  style: primaryTitleStyle.copyWith(color: primaryColor3),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
