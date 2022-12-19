import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/calib_power_last/cubit/calib_power_last_cubit.dart';
import 'package:jig/ui/screen/main/test/calib_power_last/cubit/calib_power_last_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class CalibPowerLastScreen extends StatefulWidget {
  const CalibPowerLastScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<CalibPowerLastScreen> createState() => _CalibPowerLastScreenState();
}

class _CalibPowerLastScreenState extends State<CalibPowerLastScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalibPowerLastCubit()..openPort(),
      child: BlocConsumer<CalibPowerLastCubit, CalibPowerLastState>(
        listener: (context, state) {
          if (state.result == ResultStatus.pass ||
              state.result == ResultStatus.fail) {
            widget.onPress?.call(state.result!);
          }
          if (state.error != "") {
            getIt.get<IToast>().show(
                title: "Lỗi",
                message: state.error,
                hasDismissButton: true,
                duration: const Duration(milliseconds: 1000));
          }
        },
        builder: (context, state) {
          return BaseTestScreen(
              resultStatus: state.result ?? ResultStatus.doing,
              title: "CALIB CÔNG SUẤT SAU HIỆU CHỈNH",
              child: body(context));
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 260.w,
              child: Text(
                "Công suất mạch đo (W):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "1.0349",
                style: primaryTitleStyle.copyWith(color: primaryColor3),
              ),
            ),
          ],
        ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 260.w,
              child: Text(
                "Công suất mạch đo (W):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "1.0349",
                style: primaryTitleStyle.copyWith(color: primaryColor3),
              ),
            ),
          ],
        ),
        SizedBox(
          height: defaultPaddingScreen,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 260.w,
              child: Text(
                "Sai số (%):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "0.02%",
                style: primaryTitleStyle.copyWith(color: errorColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
