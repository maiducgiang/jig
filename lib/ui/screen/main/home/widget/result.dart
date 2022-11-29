import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/model/result/result_model.dart';

import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.results, this.resultFinal = false});
  final List<ResultModel> results;
  final bool resultFinal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
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
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        for (int i = 0; i < results.length; i++)
                          itemData(index: i, resultModel: results[i])
                      ],
                    ),
                    statusTest(context)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget statusTest(BuildContext context) {
    return Container(
      width: 300.w,
      height: results.length * 50.h,
      decoration: BoxDecoration(
          color: resultFinal == true ? primaryColor3 : errorColor),
      child: Column(
        children: [
          Text(
            resultFinal == true ? "PASS" : "FAIL",
            style: primaryHeaderTitleStyle.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget itemData({required int index, required ResultModel resultModel}) {
    return Container(
      width: 800.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.white : const Color(0xffF0F0F0)),
      child: Row(children: [
        SizedBox(
          width: 350.w,
          child: Padding(
            padding: EdgeInsets.only(left: defaultPaddingScreen),
            child: Text(
              resultModel.title,
              style: primaryTitleStyle.copyWith(),
            ),
          ),
        ),
        SizedBox(
          width: 400.w,
          child: Text(
            resultModel.result,
            style: primaryTitleStyle.copyWith(color: resultModel.colorResult),
          ),
        )
      ]),
    );
  }
}
