import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class StatusLedScreen extends StatefulWidget {
  const StatusLedScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<StatusLedScreen> createState() => _StatusLedScreenState();
}

class _StatusLedScreenState extends State<StatusLedScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(title: "TRẠNG THÁI ĐÈN LED", child: body(context));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bạn có nhìn thấy tất cả LED trên mạch sáng không ?",
          style: primaryTitleStyle.copyWith(color: Colors.black),
        ),
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
