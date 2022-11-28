import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/router/router.gr.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class BaseScreenWindow extends StatefulWidget {
  const BaseScreenWindow({super.key, required this.child});
  final Widget child;
  @override
  State<BaseScreenWindow> createState() => _BaseScreenWindowState();
}

class _BaseScreenWindowState extends State<BaseScreenWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: backgroundColor),
        child: body(context),
      )),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        header(context),
        const Divider(
          thickness: 2,
          color: Colors.white,
          height: 0,
          indent: 0,
          endIndent: 0,
        ),
        widget.child
      ],
    );
  }

  Widget header(BuildContext context) {
    return Container(
      height: 88.h,
      padding: EdgeInsets.symmetric(
        horizontal: defaultPaddingScreen,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {
            context.router.pop();
          },
          child: Text(
            "JIG TEST",
            style: primaryHeaderTitleStyle.copyWith(),
          ),
        ),
        // Row(
        //   children: [
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.settings,
        //           size: 42.sp,
        //           color: primaryColor,
        //         ),
        //         SizedBox(
        //           width: defaultPaddingScreen / 2,
        //         ),
        //         Text(
        //           "Cài đặt",
        //           style: primaryHeaderTitleStyle.copyWith(fontSize: 36.sp),
        //         )
        //       ],
        //     ),
        //     SizedBox(
        //       width: defaultPaddingScreen * 2,
        //     ),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.output_outlined,
        //           size: 42.sp,
        //           color: primaryColor,
        //         ),
        //         SizedBox(
        //           width: defaultPaddingScreen / 2,
        //         ),
        //         Text(
        //           "Đăng xuất",
        //           style: primaryHeaderTitleStyle.copyWith(fontSize: 36.sp),
        //         )
        //       ],
        //     )
        //   ],
        // )
      ]),
    );
  }
}
