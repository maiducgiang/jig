import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/status_led/cubit/status_led_cubit.dart';
import 'package:jig/ui/screen/main/test/status_led/cubit/status_led_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class StatusLedScreen extends StatefulWidget {
  const StatusLedScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<StatusLedScreen> createState() => _StatusLedScreenState();
}

class _StatusLedScreenState extends State<StatusLedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatusLedCubit()..openPort(),
      child: BlocConsumer<StatusLedCubit, StatusLedState>(
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
              title: "TRẠNG THÁI ĐÈN LED",
              child: body(context));
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bạn có nhìn thấy tất cả LED trên mạch sáng không ?",
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
