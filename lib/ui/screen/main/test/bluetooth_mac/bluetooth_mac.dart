import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/bluetooth_mac/cubit/bluetooth_mac_cubit.dart';
import 'package:jig/ui/screen/main/test/bluetooth_mac/cubit/bluetooth_mac_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class BluetoothMacScreen extends StatefulWidget {
  const BluetoothMacScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<BluetoothMacScreen> createState() => _BluetoothMacScreenState();
}

class _BluetoothMacScreenState extends State<BluetoothMacScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BluetoothMacCubit()..openPort(),
      child: BlocConsumer<BluetoothMacCubit, BluetoothMacState>(
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
              title: "BLUETOOTH MAC",
              child: body(context));
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: TextSpan(
                text: "Điện thoại bạn nhận Bluetooth phát ra\n có khớp với mã",
                style: primaryTitleStyle.copyWith(color: Colors.black),
                children: [
              TextSpan(
                  text: " MCT-xxxxxx",
                  style: primaryTitleStyle.copyWith(color: primaryColor)),
              TextSpan(
                  text: " không?",
                  style: primaryTitleStyle.copyWith(color: Colors.black)),
            ])),
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
