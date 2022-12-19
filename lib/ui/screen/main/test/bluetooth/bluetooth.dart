import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/bluetooth/cubit/bluetooth_cubit.dart';
import 'package:jig/ui/screen/main/test/bluetooth/cubit/bluetooth_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

import '../../../../../data/enum/enum_test_status.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BluetoothCubit()..openPort(),
      child: BlocConsumer<BluetoothCubit, BluetoothState>(
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
            title: "KẾT NỐI BLUETOOTH, WIFI",
            resultStatus: state.result ?? ResultStatus.check,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 260.w,
                      child: Text(
                        "Wi-Fi:",
                        style: primaryTitleStyle.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        "Kết nối thành công",
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
                        "Bluetooth:",
                        style: primaryTitleStyle.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        "Kết nối thành công",
                        style: primaryTitleStyle.copyWith(color: primaryColor3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
