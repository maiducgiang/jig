import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/router/router.gr.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: backgroundColor),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 553.w,
            height: 693.h,
            decoration: const BoxDecoration(color: Colors.white),
            child: body(context),
          ),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPaddingScreen * 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: defaultPaddingScreen * 3,
        ),
        SizedBox(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "JIG TEST",
              textAlign: TextAlign.center,
              style: primaryHeaderTitleStyle.copyWith(
                  fontSize: 48.sp,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: defaultPaddingScreen * 2,
        ),
        Text(
          "Tên đăng nhập",
          style: primaryTitleStyle.copyWith(
            fontSize: 32.sp,
          ),
        ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        TextFormFieldInput(controller: emailController, hinText: "email"),
        SizedBox(
          height: defaultPaddingScreen * 2,
        ),
        Text(
          "Mật khẩu",
          style: primaryTitleStyle.copyWith(fontSize: 32.sp),
        ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        TextFormFieldInput(controller: passController, hinText: "password"),
        SizedBox(
          height: defaultPaddingScreen * 2,
        ),
        PrimaryButton(
          label: "Đăng nhập",
          backgroundColor: primaryColor,
          onPressed: (() {
            context.router.push(const MainPage());
          }),
        )
      ]),
    );
  }
}
