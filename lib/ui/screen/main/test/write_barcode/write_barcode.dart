import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/write_barcode/cubit/write_barcode_cubit.dart';
import 'package:jig/ui/screen/main/test/write_barcode/cubit/write_barcode_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class WriteBarcodeScreen extends StatefulWidget {
  const WriteBarcodeScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<WriteBarcodeScreen> createState() => _WriteBarcodeScreenState();
}

class _WriteBarcodeScreenState extends State<WriteBarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WriteBarcodeCubit()..openPort(),
      child: BlocConsumer<WriteBarcodeCubit, WriteBarcodeState>(
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
            title: "GHI MÃ VẠCH",
            child: Column(
              children: [
                SizedBox(
                  width: 700.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Serial Code",
                        style: primaryTitleStyle.copyWith(),
                      ),
                      SizedBox(
                        height: defaultPaddingScreen,
                      ),
                      TextFormFieldInput(
                          isBarcode: true,
                          controller: TextEditingController(),
                          hinText: ""),
                      SizedBox(
                        height: defaultPaddingScreen,
                      ),
                      PrimaryButton(
                        label: "Ghi mã mạch",
                        backgroundColor: primaryColor,
                        onPressed: (() {}),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
