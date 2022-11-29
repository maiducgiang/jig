import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/router/router.gr.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        // const Divider(
        //   thickness: 2,
        //   color: Colors.white,
        // ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        // Container(
        //   width: double.infinity,
        //   height: 500.h,
        //   child: selectTest(context),
        // ),

        Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: defaultPaddingScreen,
                vertical: defaultPaddingScreen),
            color: Colors.white,
            child: selectTest(context),
          ),
        )
      ],
    );
  }

  Widget selectTest(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 24.h,
        mainAxisSpacing: 24.h,
        childAspectRatio: 2,
        //physics: const NeverScrollableScrollPhysics(),
        children: [
          for (int i = 0; i < 4; i++)
            InkWell(
              onTap: (() {
                context.router.push(const HomePage());
              }),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    color: Colors.grey[350]),
                child: FittedBox(
                    child: Text(
                  "TEST $i: ",
                  style: TextStyle(
                    color: contentColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            ),
        ]);
  }

  Widget header(BuildContext context) {
    return Container(
      height: 88.h,
      padding: EdgeInsets.symmetric(
        horizontal: defaultPaddingScreen,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "JIG TEST",
          style: primaryHeaderTitleStyle.copyWith(),
        ),
        Row(
          children: [
            Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 42.sp,
                  color: primaryColor,
                ),
                SizedBox(
                  width: defaultPaddingScreen / 2,
                ),
                InkWell(
                  onTap: (() {
                    context.router.push(const SettingPage());
                  }),
                  child: Text(
                    "Cài đặt",
                    style: primaryHeaderTitleStyle.copyWith(),
                  ),
                )
              ],
            ),
            SizedBox(
              width: defaultPaddingScreen * 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.output_outlined,
                  size: 42.sp,
                  color: primaryColor,
                ),
                SizedBox(
                  width: defaultPaddingScreen / 2,
                ),
                Text(
                  "Đăng xuất",
                  style: primaryHeaderTitleStyle.copyWith(),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
