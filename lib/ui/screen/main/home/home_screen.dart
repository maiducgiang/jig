import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/data/model/question/question_model.dart';
import 'package:jig/data/model/result/result_model.dart';
import 'package:jig/ui/screen/main/home/cubit/home_cubit.dart';
import 'package:jig/ui/screen/main/home/cubit/home_state.dart';
import 'package:jig/ui/screen/main/home/widget/result.dart';
import 'package:jig/ui/screen/main/test/bluetooth/bluetooth.dart';
import 'package:jig/ui/screen/main/test/bluetooth_mac/bluetooth_mac.dart';
import 'package:jig/ui/screen/main/test/calib_power_last/calib_power_last.dart';
import 'package:jig/ui/screen/main/test/info_device/info_device.dart';
import 'package:jig/ui/screen/main/test/ir/ir_write_read.dart';
import 'package:jig/ui/screen/main/test/model_test.dart/model_test.dart';
import 'package:jig/ui/screen/main/test/status_button/status_button.dart';
import 'package:jig/ui/screen/main/test/status_led/status_lead.dart';
import 'package:jig/ui/screen/main/test/voice/voice.dart';
import 'package:jig/ui/screen/main/test/write_barcode/write_barcode.dart';
import 'package:jig/ui/shared/base_screen.dart';
import 'package:jig/ui/theme/constant.dart';

import '../test/calib_power/calib_power.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<ResultModel> results = [
  ResultModel(result: "Model ", title: "Model:", status: true),
  ResultModel(
      result: "Firmwave version ", title: "Firmware version:", status: true),
  ResultModel(result: "Serial Code:", title: "Firmware version:", status: true),
  ResultModel(
      result: "FAIL",
      title: "Kết nối bluetooth, Wifi:",
      status: true,
      colorResult: primaryColor3),
  ResultModel(
      result: "FAIL",
      title: "Thu phát hồng ngoại:",
      status: true,
      colorResult: primaryColor3),
  ResultModel(
      result: "FAIL",
      title: "Calib công suât:",
      status: true,
      colorResult: primaryColor3),
  ResultModel(
      result: "FAIL",
      title: "Calib công suất sau hiệu chỉnh:",
      status: true,
      colorResult: primaryColor3),
  ResultModel(
      result: "FAIL",
      title: "Trạng thái đèn LED:",
      status: true,
      colorResult: primaryColor3),
  ResultModel(
      result: "FAIL",
      title: "Trạng thái đèn nút bấm:",
      status: true,
      colorResult: primaryColor3),
  ResultModel(
      result: "FAIL",
      title: "Bluetooth MAC:",
      status: true,
      colorResult: primaryColor3),
];

class _HomeScreenState extends State<HomeScreen> {
  late String check = "";
  final List<Question> listQuestion = [
    Question(
      title: "Test 1",
      child: InfoDeviceScreen(
        onPress: (value) {
          results[0] = results[0].copyWith(
              result: "Model +${value.display()}", colorResult: value.color());
        },
      ),
      resultStatus: ResultStatus.fail,
      status: SelectTestStatus.selected,
    ),
    Question(
        title: "Test 2",
        child: WriteBarcodeScreen(
          onPress: (value) {
            results[1] = results[1].copyWith(
                result: "Firmwave version +${value.display()}",
                colorResult: value.color());
          },
        ),
        resultStatus: ResultStatus.pass,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 3",
        child: BluetoothScreen(
          onPress: (value) {
            results[2] = results[2].copyWith(
                result: "Serial Code +${value.display()}",
                colorResult: value.color());
          },
        ),
        resultStatus: ResultStatus.pass,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 4",
        child: IrWriteReadScreen(
          onPress: (value) {
            results[3] = results[3]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        resultStatus: ResultStatus.pass,
        status: SelectTestStatus.selected),
    Question(
        title: "Test 5",
        child: CalibPowerScreen(
          onPress: (value) {
            results[4] = results[4]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        status: SelectTestStatus.select),
    Question(
        title: "Test 6",
        child: CalibPowerLastScreen(
          onPress: (value) {
            results[5] = results[5]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 7",
        child: StatusLedScreen(
          onPress: (value) {
            results[6] = results[6]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 8",
        child: StatusButtonScreen(
          onPress: (value) {
            results[7] = results[7]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 9",
        child: VoiceScreen(
          onPress: (value) {
            results[8] = results[8]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        status: SelectTestStatus.notSelect),
    Question(
        title: "Test 10",
        child: BluetoothMacScreen(
          onPress: (value) {
            results[9] = results[9]
                .copyWith(result: value.display(), colorResult: value.color());
          },
        ),
        status: SelectTestStatus.notSelect),
  ];
  PageController pageController = PageController();
  int selected = 0;
  TestStatus status = TestStatus.stop;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..initCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          context.read<HomeCubit>().createUser();
          return BaseScreenWindow(
            child: Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: body(
                  context,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget body(
    BuildContext context,
  ) {
    return Column(children: [
      Container(
        height: 120.h,
        padding: EdgeInsets.symmetric(
            horizontal: defaultPaddingScreen, vertical: defaultPaddingScreen),
        decoration: const BoxDecoration(color: backgroundColor),
        child: Center(
          child: GridView.count(
              crossAxisCount: 12,
              crossAxisSpacing: 4.h,
              mainAxisSpacing: 8.h,
              childAspectRatio: 2.5,
              children: [
                itemFirst(context),
                for (int i = 0; i < listQuestion.length; i++)
                  InkWell(
                      onTap: () {
                        if (status == TestStatus.doing) {
                          setState(() {
                            selected = i;
                            pageController.animateToPage(
                              i,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          });
                        }
                      },
                      child: itemTest(
                        context: context,
                        index: i,
                        select: selected,
                        title: listQuestion[i].title,
                      )),
                itemSubmit(context)
              ]),
        ),
      ),
      status == TestStatus.stop
          ? Expanded(child: ModelTestScreen(
              onPress: () {
                setState(() {
                  status = TestStatus.doing;
                });
              },
            ))
          : (status == TestStatus.doing
              ? Expanded(
                  child: PageView.builder(
                      itemCount: listQuestion.length,
                      controller: pageController,
                      itemBuilder: (context, index) {
                        return listQuestion[index].child;
                        // return BaseTestScreen(
                        //     resultStatus: listQuestion[index].resultStatus!,
                        //     child: listQuestion[index].child);
                      }))
              : Expanded(
                  child: ResultScreen(
                  results: results,
                )))
    ]);
  }

  Widget itemFirst(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),
          color: status == TestStatus.doing ? Colors.red : primaryColor3),
      child: FittedBox(
          child: Row(
        children: [
          Icon(
            status == TestStatus.doing ? Icons.pause : Icons.arrow_right,
            color: Colors.white,
          ),
          const SizedBox(
            width: 4,
          ),
          const Text(
            "Dừng",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      )),
    );
  }

  Widget itemSubmit(
    BuildContext context,
  ) {
    return InkWell(
      onTap: (() {
        setState(() {
          status = TestStatus.end;
        });
      }),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            border: Border.all(color: Colors.red, width: 1),
            color: Colors.white),
        child: FittedBox(
            child: Row(
          children: const [
            Text(
              "Submit",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget itemTest(
      {required BuildContext context,
      required String title,
      required int index,
      required int select}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Colors.white,
        border: Border.all(
            color: index < selected
                ? primaryColor3
                : (index == selected
                    ? const Color(0xff0079D7)
                    : const Color(0xffCCCBCB))),
      ),
      child: FittedBox(
          child: Text(
        title,
        style: TextStyle(
          color: index < selected
              ? primaryColor3
              : (index == selected
                  ? const Color(0xff0079D7)
                  : const Color(0xffCCCBCB)),
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
