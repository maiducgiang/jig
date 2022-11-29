import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: body(context),
    );
  }

  Widget body(BuildContext buildContext) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: defaultPaddingScreen,
              ),
              Text(
                "KẾT QUẢ TEST",
                style: primaryHeaderTitleStyle.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: defaultPaddingScreen,
              ),
              Table(
                // textDirection: TextDirection.rtl,
                // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                // border:TableBorder.all(width: 2.0,color: Colors.red),
                children: const [
                  TableRow(children: [
                    Text(
                      "Model:",
                      textScaleFactor: 1.5,
                    ),
                    Text("Institution name", textScaleFactor: 1.5),
                    Text("University", textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("B.Tech", textScaleFactor: 1.5),
                    Text("ABESEC", textScaleFactor: 1.5),
                    Text("AKTU", textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("12th", textScaleFactor: 1.5),
                    Text("Delhi Public School", textScaleFactor: 1.5),
                    Text("CBSE", textScaleFactor: 1.5),
                  ]),
                  TableRow(children: [
                    Text("High School", textScaleFactor: 1.5),
                    Text("SFS", textScaleFactor: 1.5),
                    Text("ICSE", textScaleFactor: 1.5),
                  ]),
                ],
              ),

              /*Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        itemData(
                            title: "Model:",
                            content: "Model 1234abc",
                            index: 0),
                        itemData(
                            title: "Firmware version:",
                            content: "Firmwave version 123456",
                            index: 1),
                        itemData(
                            title: "Serial code:",
                            content: "CT1234567890",
                            index: 0),
                        itemData(
                            title: "Kết nối bluetooth, Wifi:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 1),
                        itemData(
                            title: "Thu phát hồng ngoại:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 0),
                        itemData(
                            title: "Calib công suât:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 1),
                        itemData(
                            title: "Calib công suất sau hiệu chỉnh:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 0),
                        itemData(
                            title: "Trạng thái đèn LED:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 1),
                        itemData(
                            title: "Trạng thái đèn nút bấm:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 0),
                        itemData(
                            title: "Bluetooth MAC:",
                            content: "PASS",
                            colorContent: primaryColor3,
                            index: 1),
                      ],
                    ),
                    Container(
                      width: 300.w,
                      height: 500.h,
                      decoration: const BoxDecoration(color: primaryColor3),
                    )
                  ],
                ),
              )*/
            ],
          ),
        ),
      ],
    );
  }

  Widget itemData(
      {required String title,
      required String content,
      Color colorContent = titleColor,
      required int index}) {
    return Container(
      width: 800.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.white : const Color(0xffF0F0F0)),
      child: Row(children: [
        SizedBox(
          width: 350.w,
          child: Text(
            title,
            style: primaryTitleStyle.copyWith(),
          ),
        ),
        SizedBox(
          width: 400.w,
          child: Text(
            content,
            style: primaryTitleStyle.copyWith(color: colorContent),
          ),
        )
      ]),
    );
  }
}
