import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class CalibPowerLastScreen extends StatefulWidget {
  const CalibPowerLastScreen({super.key});

  @override
  State<CalibPowerLastScreen> createState() => _CalibPowerLastScreenState();
}

class _CalibPowerLastScreenState extends State<CalibPowerLastScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(
        title: "CALIB CÔNG SUẤT SAU HIỆU CHỈNH", child: body(context));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 260.w,
              child: Text(
                "Công suất mạch đo (W):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "1.0349",
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
                "Công suất mạch đo (W):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "1.0349",
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
                "Sai số (%):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "0.02%",
                style: primaryTitleStyle.copyWith(color: errorColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
