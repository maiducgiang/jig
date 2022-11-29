import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class CalibPowerScreen extends StatefulWidget {
  const CalibPowerScreen({super.key});

  @override
  State<CalibPowerScreen> createState() => _CalibPowerScreenState();
}

class _CalibPowerScreenState extends State<CalibPowerScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(title: "CALIB CÔNG SUẤT", child: body(context));
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
                "Công suất máy đo (W):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "1.1451",
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
