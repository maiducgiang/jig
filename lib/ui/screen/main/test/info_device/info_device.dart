import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/info_device/cubit/info_device_cubit.dart';
import 'package:jig/ui/screen/main/test/info_device/cubit/info_device_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class InfoDeviceScreen extends StatefulWidget {
  const InfoDeviceScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<InfoDeviceScreen> createState() => _InfoDeviceScreenState();
}

class _InfoDeviceScreenState extends State<InfoDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfoDeviceCubit()..openPort(),
      child: BlocConsumer<InfoDeviceCubit, InfoDeviceState>(
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
            title: "THÔNG TIN THIẾT BỊ",
            resultStatus: state.result ?? ResultStatus.doing,
            child: Column(
              children: [
                // SizedBox(
                //   height: defaultPaddingScreen * 2,
                // ),
                // Text(
                //   ,
                //   style: primaryHeaderTitleStyle.copyWith(color: Colors.black),
                // ),
                // SizedBox(
                //   height: defaultPaddingScreen * 2,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 260.h,
                      child: Text(
                        "Model:",
                        style: primaryTitleStyle.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 600.h,
                      child: Text(
                        "Model 1234abc",
                        style: primaryTitleStyle.copyWith(color: Colors.black),
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
                      width: 260.h,
                      child: Text(
                        "Firmware:",
                        style: primaryTitleStyle.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: 600.h,
                      child: Text(
                        "Firmware version 123456",
                        style: primaryTitleStyle.copyWith(color: Colors.black),
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
