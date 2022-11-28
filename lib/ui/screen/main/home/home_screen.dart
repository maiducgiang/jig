import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/data/model/question/question_model.dart';
import 'package:jig/ui/screen/main/home/widget/grip_view_amont_question.dart';
import 'package:jig/ui/screen/main/test/info_device/info_device.dart';
import 'package:jig/ui/shared/base_screen.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Question> listQuestion = [
    Question(
        title: "Test 1",
        child: InfoDeviceScreen(),
        resultStatus: ResultStatus.fail,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 2",
        child: Container(
          child: Center(
              child: Text(
            "2",
            style: primaryHeaderTitleStyle,
          )),
        ),
        resultStatus: ResultStatus.pass,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 3",
        child: Container(
          child: Center(
              child: Text(
            "3",
            style: primaryHeaderTitleStyle,
          )),
        ),
        resultStatus: ResultStatus.pass,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 4",
        child: Container(
          child: Center(
              child: Text(
            "4",
            style: primaryHeaderTitleStyle,
          )),
        ),
        resultStatus: ResultStatus.pass,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 5",
        child: Container(
          child: Center(
              child: Text(
            "5",
            style: primaryHeaderTitleStyle,
          )),
        ),
        status: SelectTestStatus.select),
    Question(
        title: "Test 6",
        child: Container(
          child: Center(
              child: Text(
            "6",
            style: primaryHeaderTitleStyle,
          )),
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 7",
        child: Container(
          child: Center(
              child: Text(
            "7",
            style: primaryHeaderTitleStyle,
          )),
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 8",
        child: Container(
          child: Center(
              child: Text(
            "8",
            style: primaryHeaderTitleStyle,
          )),
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 9",
        child: Container(
          child: Center(
              child: Text(
            "9",
            style: primaryHeaderTitleStyle,
          )),
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 10",
        child: Container(
          child: Center(
              child: Text(
            "10",
            style: primaryHeaderTitleStyle,
          )),
        ),
        status: SelectTestStatus.notSelect),
  ];
  PageController pageController = PageController();
  int selected = 0;
  TestStatus status = TestStatus.doing;
  @override
  Widget build(BuildContext context) {
    return BaseScreenWindow(
      child: Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: body(context, listQuestion, pageController),
        ),
      ),
    );
  }

  Widget body(BuildContext context, List<Question> listQuestion,
      PageController pageController) {
    return Column(children: [
      Container(
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
                ),
                for (int i = 0; i < listQuestion.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = i;
                        pageController.animateToPage(
                          i,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        color: Colors.white,
                        border: Border.all(
                            color: i < selected
                                ? const Color(0xff0DC301)
                                : (i == selected
                                    ? const Color(0xff0079D7)
                                    : const Color(0xffCCCBCB))),
                      ),
                      child: FittedBox(
                          child: Text(
                        listQuestion[i].title,
                        style: TextStyle(
                          color: i < selected
                              ? const Color(0xff0DC301)
                              : (i == selected
                                  ? const Color(0xff0079D7)
                                  : const Color(0xffCCCBCB)),
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
              ]),
        ),
      ),
      Expanded(
          child: PageView.builder(
              itemCount: listQuestion.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return listQuestion[index].child;
                // return BaseTestScreen(
                //     resultStatus: listQuestion[index].resultStatus!,
                //     child: listQuestion[index].child);
              }))
    ]);
  }
}
