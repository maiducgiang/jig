import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';
import 'package:loading_overlay/loading_overlay.dart';

class BaseTestScreen extends StatelessWidget {
  const BaseTestScreen(
      {super.key,
      this.resultStatus = ResultStatus.doing,
      required this.child,
      required this.title});
  final ResultStatus resultStatus;
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: defaultPaddingScreen * 2,
            ),
            Text(
              title,
              style: primaryHeaderTitleStyle.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: defaultPaddingScreen * 2,
            ),
            child,
          ],
        )),
        Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(color: resultStatus.color()),
          child: resultStatus == ResultStatus.doing
              ? LoadingOverlay(isLoading: true, child: Container())
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      resultStatus.display(),
                      style: primaryHeaderTitleStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 36.sp),
                    )
                  ],
                ),
        )
      ]),
    );
  }
}
