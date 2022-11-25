import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/constant.dart';

class IndicatorSignIn extends StatelessWidget {
  const IndicatorSignIn({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 22.w : 8.w,
      height: 8.h,
      decoration: BoxDecoration(
          //border: Border.all(color: Colors.grey),
          color: isActive ? primaryColor : Colors.grey,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
