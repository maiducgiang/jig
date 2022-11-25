import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

import '../utils/functions.dart';
import '../widget/button/primary_button.dart';

class DialogTextField extends StatelessWidget {
  final BuildContext context;
  final String title;
  final Function()? onDismiss;
  final Function(String data)? onConfirm;
  final int? minLines;
  final int? maxLines;
  final String? hint;
  final String? confirmTitlel;
  final TextInputType? inputType;

  const DialogTextField(
      {Key? key,
      required this.context,
      required this.title,
      this.confirmTitlel,
      this.onConfirm,
      this.inputType = TextInputType.text,
      this.onDismiss,
      this.minLines = 10,
      this.maxLines = 30,
      this.hint})
      : super(key: key);

  @override
  Widget build(context) {
    final textController = TextEditingController(text: hint);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(defaultPaddingScreen),
      child: Container(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(
                        left: defaultPaddingScreen,
                        right: defaultPaddingScreen,
                        bottom: 16.h,
                        top: 5.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: onDismiss,
                              child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Icon(
                                    Ionicons.close_circle_sharp,
                                    color: Colors.red,
                                    size: 30.sp,
                                  ))),
                        ),
                        Text(
                          title,
                          style: primaryTitleStyle.copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: defaultPaddingScreen),
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, bottom: 20.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.grey, width: 1.0)),
                          child: TextFormField(
                              cursorColor: const Color(0xFF9b9b9b),
                              autofocus: true,
                              maxLines: maxLines,
                              minLines: minLines,
                              validator: (_) {
                                return textController.text == ""
                                    ? 'Vui lòng không bỏ trống'
                                    : null;
                              },
                              controller: textController,
                              keyboardType: inputType,
                              decoration: InputDecoration(
                                  hintText: hint,
                                  enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0)),
                                  focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0)))),
                        ),
                        SizedBox(
                          height: defaultPaddingScreen,
                        ),
                        PrimaryButton(
                          label: "Xác nhận",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              unfocus(context);
                              onConfirm?.call(textController.text);
                            } else {
                              return;
                            }
                          },
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
