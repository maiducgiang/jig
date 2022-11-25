import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:jig/foundation/extension/string_formatting.dart';
import 'package:jig/foundation/extension/validation.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';


class PrimaryTextField extends StatelessWidget {
  final String label;
  final bool? isPass;
  final bool? isUsername;
  final bool? isEmail;
  final bool? isPhone;
  final bool isNumberKey;
  final String? hintText;
  final bool? isTitle;
  final bool? isPrice;
  final bool? isDesc;
  final bool? ispercent;
  String? errorText;
  final bool isSecondTextField;
  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  final String? customErrorText;
  final bool isValidate;
  PrimaryTextField(
      {Key? key,
      required this.label,
      this.isPass,
      this.ispercent,
      required this.controller,
      this.isUsername,
      this.isEmail,
      this.isPhone,
      this.errorText,
      this.hintText,
      this.isTitle,
      this.isPrice,
      this.isDesc,
      this.isNumberKey = false,
      this.isSecondTextField = false,
      this.maxLines,
      this.minLines,
      this.customErrorText,
      this.isValidate = true})
      : super(key: key);

  final ValueNotifier _isShow = ValueNotifier(false);
  final ValueNotifier _isError = ValueNotifier(false);
  static const _locale = 'en';

  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale)
      .format(int.parse(s.isEmpty ? '0' : s));

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _isShow,
        builder: (context, value, _) {
          return ValueListenableBuilder(
              valueListenable: _isError,
              builder: (context, value, _) {
                _isError.value = errorText != null ? true : false;
                return TextFormField(
                  maxLines: maxLines,
                  minLines: minLines,
                  maxLength: ispercent == true ? 2 : null,
                  enableSuggestions: true,
                  autovalidateMode:
                      _isError.value ? AutovalidateMode.always : null,
                  autofillHints: const [AutofillHints.oneTimeCode],
                  validator: (text) {
                    if (isValidate) {
                      if (isPhone == true) {
                        if (text!.isNotEmpty &&
                            text.formatPhoneNumber().isValidPhone == false) {
                          return "Số điện thoại không đúng";
                        }
                      }
                      if (isPrice == true) {
                        final price = controller.value.text;
                        final splitPrice = price.replaceAll(",", "");
                        if (splitPrice.isEmpty) {
                          return "Vui lòng điền đầy đủ thông tin";
                        }
                      }
                      if (ispercent == true) {
                        final price = controller.value.text;
                        final splitPrice = price.replaceAll(",", "");
                        if (splitPrice.isEmpty) {
                          return "Vui lòng điền đầy đủ thông tin";
                        }
                      }
                      if (isTitle == true) {
                        final title = controller.value.text;
                        if (title == "") {
                          return "Vui lòng điền đầy đủ thông tin";
                        }
                      }
                    }
                    return null;
                  },
                  controller: controller,
                  obscureText: isPass == true ? !_isShow.value : false,
                  style: primaryTitleStyle.copyWith(
                      height: 1.3,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal),
                  keyboardType: isPhone == true || isNumberKey
                      ? const TextInputType.numberWithOptions()
                      : TextInputType.text,
                  onChanged: isPrice == true
                      ? (string) {
                          string = _formatNumber(string.replaceAll(',', ''));
                          controller.value = TextEditingValue(
                            text: string,
                            selection:
                                TextSelection.collapsed(offset: string.length),
                          );
                        }
                      : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: backgroundTextField,
                    errorStyle: TextStyle(fontSize: 10.sp, color: Colors.red),
                    hintText: hintText ?? '',
                    hintStyle: primaryTitleStyle.copyWith(color: greyText),
                    prefixIcon: isPhone == true
                        ? Icon(
                            Ionicons.call_outline,
                            size: 18.sp,
                            color: primaryColor,
                          )
                        : isPass == true
                            ? Icon(
                                Ionicons.lock_closed_outline,
                                size: 18.sp,
                                color: primaryColor,
                              )
                            : null,
                    suffixIcon: isPrice == true
                        ? Container(
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.only(top: 8.h, right: 6.w),
                            child: Text("vnđ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500)),
                          )
                        : ispercent == true
                            ? Container(
                                padding: EdgeInsets.zero,
                                margin: EdgeInsets.only(top: 8.h),
                                child: Text("%",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500)),
                              )
                            : null,
                    labelStyle: primaryTitleStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w400),
                    floatingLabelStyle:
                        primaryTitleStyle.copyWith(color: primaryColor),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                    contentPadding: EdgeInsets.only(
                        top: 10.h, bottom: 10.h, left: 16.w, right: 16.w),
                    enabledBorder: OutlineInputBorder(
                        borderSide: isSecondTextField
                            ? const BorderSide(color: greyText)
                            : BorderSide.none,
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: isSecondTextField
                            ? const BorderSide(color: greyText)
                            : BorderSide.none,
                        borderRadius: BorderRadius.circular(
                            isSecondTextField ? defaultBorderRadius : 20.r)),
                  ),
                );
              });
        });
  }
}
