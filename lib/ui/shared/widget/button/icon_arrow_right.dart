import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/theme/constant.dart';

class IconArrowRight extends StatelessWidget {
  const IconArrowRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.h,
      height: 25.h,
      alignment: Alignment.center,
      child: Icon(
        Icons.keyboard_arrow_right,
        size: 23.r,
        color: secondaryColor,
      ),
    );
  }
}
