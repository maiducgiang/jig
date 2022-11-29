import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/router/router.gr.dart';
import 'package:jig/ui/services/account_services.dart';
import 'package:jig/ui/shared/custome_cupertino_alert.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  final appCubit = getIt.get<AppCubit>();
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
                    context.router.push(const SettingPrimaryPage());
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
            InkWell(
              onTap: (() {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext dialogContext) {
                    return CustomCupertinoAlert(
                      context: context,
                      title: "Đăng xuất",
                      content: 'Xác nhận đăng xuất',
                      rightButtonTitle: 'Xác nhận',
                      rightAction: () async {
                        Navigator.pop(context);
                        AccountServices().saveUserToken('');
                        AccountServices().saveUserId('');
                        appCubit.updateUserSession(null);
                        getIt.get<IToast>().show(
                            title: 'Thông báo',
                            message: 'Đăng xuất thành công.',
                            hasDismissButton: false,
                            duration: const Duration(milliseconds: 1000));

                        context.router.replace(const SignInPage());
                      },
                    );
                  },
                );
                setState(() {});
              }),
              child: Row(
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
              ),
            )
          ],
        )
      ]),
    );
  }
}
