import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class WriteBarcodeScreen extends StatefulWidget {
  const WriteBarcodeScreen({super.key});

  @override
  State<WriteBarcodeScreen> createState() => _WriteBarcodeScreenState();
}

class _WriteBarcodeScreenState extends State<WriteBarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(
      title: "GHI MÃ VẠCH",
      resultStatus: ResultStatus.pass,
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
  }
}
