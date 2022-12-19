import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_model_test.dart';
import 'package:jig/ui/router/router.gr.dart';
import 'package:jig/ui/screen/main/setting/widget/dropdown.dart';
import 'package:jig/ui/shared/base_screen.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class SettingPrimaryScreen extends StatefulWidget {
  const SettingPrimaryScreen({super.key});

  @override
  State<SettingPrimaryScreen> createState() => _SettingPrimaryScreenState();
}

class _SettingPrimaryScreenState extends State<SettingPrimaryScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenWindow(
      child: Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: backgroundColor),
          child: body(
            context,
          ),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: defaultPaddingScreen,
          ),
          Container(
            width: 500.w,
            //height: 500.h,
            padding: EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CÀI ĐẶT",
                        style: primaryHeaderTitleStyle.copyWith(
                            color: Colors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  Text(
                    "COM Port",
                    style: primaryTitleStyle.copyWith(),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen / 4,
                  ),
                  DropdowCom(
                    comPorts: baudRateList,
                    callback: ((data) {
                      // context.read<HomeCubit>().closePort();
                      // context.read<HomeCubit>().handleReceived(data);
                      setState(() {
                        //baudRateController = data;
                      });
                    }),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  Text(
                    "Model Test",
                    style: primaryTitleStyle.copyWith(),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen / 4,
                  ),
                  DropdowCom(
                    comPorts: ModelTest.getListModelTest(),
                    callback: ((data) {
                      // context.read<HomeCubit>().closePort();
                      // context.read<HomeCubit>().handleReceived(data);
                      setState(() {
                        //baudRateController = data;
                      });
                    }),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (onChanged) {}),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          "Rework",
                          style: primaryTitleStyle.copyWith(
                              color: contentColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  Text(
                    "Wifi",
                    style: primaryTitleStyle.copyWith(),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen / 4,
                  ),
                  TextFormFieldInput(
                      controller: TextEditingController(), hinText: "Wifi"),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  Text(
                    "Nhập mật khẩu Wi-fi",
                    style: primaryTitleStyle.copyWith(),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen / 4,
                  ),
                  TextFormFieldInput(
                      controller: TextEditingController(),
                      hinText: "Nhập mật khẩu Wi-fi"),
                  SizedBox(
                    height: defaultPaddingScreen * 2,
                  ),
                  PrimaryButton(
                    label: "Lưu",
                    backgroundColor: primaryColor,
                    onPressed: (() {
                      context.router.pop();
                    }),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                  PrimaryButton(
                    label: "Cài đặt chi tiết",
                    backgroundColor: primaryColor,
                    onPressed: (() {
                      context.router.push(const SettingPage());
                    }),
                  ),
                  SizedBox(
                    height: defaultPaddingScreen,
                  ),
                ]),
          ),
          SizedBox(
            height: defaultPaddingScreen,
          ),
        ],
      ),
    );
  }
}
