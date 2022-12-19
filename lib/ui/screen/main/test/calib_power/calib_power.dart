import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/calib_power/cubit/calib_power_cubit.dart';
import 'package:jig/ui/screen/main/test/calib_power/cubit/calib_power_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class CalibPowerScreen extends StatefulWidget {
  const CalibPowerScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<CalibPowerScreen> createState() => _CalibPowerScreenState();
}

class _CalibPowerScreenState extends State<CalibPowerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalibPowerCubit()..openPort(),
      child: BlocConsumer<CalibPowerCubit, CalibPowerState>(
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
              title: "CALIB CÔNG SUẤT",
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
                "Công suất máy đo (W):",
                style: primaryTitleStyle.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                "1.1451",
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
