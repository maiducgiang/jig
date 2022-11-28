import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/theme/constant.dart';

class GripViewAmountQuestion extends StatelessWidget {
  const GripViewAmountQuestion(
      {super.key, this.listQuestion, required this.status});
  final List<Question>? listQuestion;
  final TestStatus status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPaddingScreen, vertical: defaultPaddingScreen),
      decoration: const BoxDecoration(color: backgroundColor),
      child: GridView.count(
          crossAxisCount: 11,
          crossAxisSpacing: 4.h,
          mainAxisSpacing: 8.h,
          childAspectRatio: 2.5,
          children: [
            for (int i = 0; i <= 20; i++)
              i == 0
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: status == TestStatus.doing
                              ? Colors.red
                              : Colors.grey),
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
                    )
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Colors.white),
                      child: FittedBox(
                          child: Text(
                        (i).toString(),
                        style: const TextStyle(
                          color: contentColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
            // for (int i = 0; i < widget.state.list_question!.length; i++)
            //   GestureDetector(
            //     onTap: () {
            //       // setState(() {
            //       //   pageController.animateToPage(
            //       //     i,
            //       //     duration: const Duration(milliseconds: 400),
            //       //     curve: Curves.easeInOut,
            //       //   );
            //       // });
            //     },
            //     child: Container(
            //       child: Center(
            //         child: FittedBox(
            //             child: Text(
            //           (i + 1).toString(),
            //           style: const TextStyle(
            //             color: Color(0xFFffffff),
            //             fontWeight: FontWeight.w600,
            //           ),
            //         )),
            //       ),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(8.sp),
            //           color: primaryColor),
            //     ),
            //   )
          ]),
    );
  }
}

class Question {
  final String title;
  final Widget child;
  final int? status;
  Question({required this.child, required this.title, this.status});
}
