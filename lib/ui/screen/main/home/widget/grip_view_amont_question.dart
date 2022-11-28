import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/theme/constant.dart';

import '../../../../../data/model/question/question_model.dart';

class GripViewAmountQuestion extends StatelessWidget {
  const GripViewAmountQuestion(
      {super.key,
      this.listQuestion,
      required this.status,
      required this.onTapSelect});
  final List<Question>? listQuestion;
  final TestStatus status;
  final Function(int) onTapSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPaddingScreen, vertical: defaultPaddingScreen),
      decoration: const BoxDecoration(color: backgroundColor),
      child: Center(
        child: GridView.count(
            crossAxisCount: 11,
            crossAxisSpacing: 4.h,
            mainAxisSpacing: 8.h,
            childAspectRatio: 2.5,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    color:
                        status == TestStatus.doing ? Colors.red : Colors.grey),
                child: FittedBox(
                    child: Row(
                  children: const [
                    Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Dừng",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )),
              ),
              for (int i = 0; i < listQuestion!.length; i++)
                InkWell(
                  onTap: onTapSelect(i),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.sp),
                      color: Colors.white,
                      border:
                          Border.all(color: listQuestion![i].status.color()),
                    ),
                    child: FittedBox(
                        child: Text(
                      listQuestion![i].title,
                      style: TextStyle(
                        color: listQuestion![i].status.color(),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
            ]),
      ),
    );
  }
}
