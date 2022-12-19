import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/status_button/cubit/status_button_cubit.dart';
import 'package:jig/ui/screen/main/test/status_button/cubit/status_button_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class StatusButtonScreen extends StatefulWidget {
  const StatusButtonScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<StatusButtonScreen> createState() => _StatusButtonScreenState();
}

class _StatusButtonScreenState extends State<StatusButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatusButtonCubit()..openPort(),
      child: BlocConsumer<StatusButtonCubit, StatusButtonState>(
        listener: (context, state) {
          if (state.result == ResultStatus.pass ||
              state.result == ResultStatus.fail) {
            widget.onPress?.call(state.result!);
          }
          if (state.error != "") {
            getIt.get<IToast>().show(
                title: 'Lỗi',
                message: state.error,
                hasDismissButton: true,
                duration: const Duration(milliseconds: 1000));
          }
        },
        builder: (context, state) {
          return BaseTestScreen(
              resultStatus: state.result ?? ResultStatus.doing,
              title: "TRẠNG THÁI NÚT BẤM",
              child: body(context));
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bấm lần 1 LED ở tất cả các nút bấm có sáng không?",
          style: primaryTitleStyle.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                color: primaryColor3,
              ),
              child: Text(
                "Có",
                style: primaryContentStyle.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: defaultPaddingScreen,
            ),
            Container(
              width: 100.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: errorColor, width: 1),
              ),
              child: Text(
                "Không",
                style: primaryContentStyle.copyWith(color: errorColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: defaultPaddingScreen * 2,
        ),
        Text(
          "Bấm lần 2 LED ở tất cả các nút bấm có sáng không?",
          style: primaryTitleStyle.copyWith(color: Colors.black),
        ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                color: primaryColor3,
              ),
              child: Text(
                "Có",
                style: primaryContentStyle.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              width: defaultPaddingScreen,
            ),
            Container(
              width: 100.w,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                border: Border.all(color: errorColor, width: 1),
              ),
              child: Text(
                "Không",
                style: primaryContentStyle.copyWith(color: errorColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
