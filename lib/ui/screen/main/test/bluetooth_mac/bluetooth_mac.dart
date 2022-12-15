import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class BluetoothMacScreen extends StatefulWidget {
  const BluetoothMacScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<BluetoothMacScreen> createState() => _BluetoothMacScreenState();
}

class _BluetoothMacScreenState extends State<BluetoothMacScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(title: "BLUETOOTH MAC", child: body(context));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: TextSpan(
                text: "Điện thoại bạn nhận Bluetooth phát ra\n có khớp với mã",
                style: primaryTitleStyle.copyWith(color: Colors.black),
                children: [
              TextSpan(
                  text: " MCT-xxxxxx",
                  style: primaryTitleStyle.copyWith(color: primaryColor)),
              TextSpan(
                  text: " không?",
                  style: primaryTitleStyle.copyWith(color: Colors.black)),
            ])),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                color: primaryColor3,
              ),
              child: Text(
                "Có",
                style: primaryContentStyle.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: defaultPaddingScreen,
            ),
            Container(
              width: 100.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: errorColor, width: 1),
              ),
              child: Text(
                "Không",
                style: primaryContentStyle.copyWith(color: errorColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
