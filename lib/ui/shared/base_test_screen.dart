import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/theme/text_style.dart';

class BaseTestScreen extends StatelessWidget {
  const BaseTestScreen(
      {super.key, this.resultStatus = ResultStatus.doing, required this.child});
  final ResultStatus resultStatus;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(children: [
        Expanded(
            child: Container(
                //color: Colors.grey[200],
                child: child)),
        Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(color: resultStatus.color()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                resultStatus.display(),
                style: primaryHeaderTitleStyle.copyWith(
                    color: Colors.white, fontSize: 48.sp),
              )
            ],
          ),
        )
      ]),
    );
  }
}
