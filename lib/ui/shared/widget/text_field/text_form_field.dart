import 'package:flutter/material.dart';
import 'package:jig/foundation/extension/validation.dart';
import '../../../theme/constant.dart';

class TextFormFieldInput extends StatefulWidget {
  const TextFormFieldInput(
      {Key? key,
      required this.controller,
      required this.hinText,
      this.error,
      this.isPass,
      this.isUsername,
      this.isEmail,
      this.isPhone,
      this.type,
      this.isCheckPass,
      this.password,
      this.onChanged,
      this.enable,
      this.isBarcode,
      this.maxLine,
      this.onTap})
      : super();
  final TextEditingController controller;
  final String hinText;
  final String? error;
  final bool? isPass;
  final bool? isBarcode;
  final bool? isUsername;
  final bool? isEmail;
  final bool? isPhone;
  final bool? isCheckPass;
  final String? password;
  final TextInputType? type;
  final bool? enable;
  final Function()? onChanged;
  final Function()? onTap;
  final int? maxLine;
  @override
  State<TextFormFieldInput> createState() => _TextFormFieldInputState();
}

class _TextFormFieldInputState extends State<TextFormFieldInput> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: 'Phone Number',
      enabled: widget.enable,
      enableSuggestions: true,
      obscureText: widget.isPass == true && check == true ? true : false,
      //autovalidateMode: AutovalidateMode.always,
      autofillHints: const [AutofillHints.oneTimeCode],
      maxLines: widget.maxLine,
      validator: (text) {
        if (widget.isCheckPass == true) {
          if (text != widget.password) {
            return "Xác nhận mật khẩu không đúng. Vui lòng thử lại";
          }
        }
        if (text!.isEmpty) {
          return "Vui lòng điền đầy đủ thông tin";
        }
        if (widget.isEmail == true) {
          if (text.isValidEmail == false) {
            return "Email đã nhập không đúng";
          }
        }
      },
      controller: widget.controller,
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!.call();
        if (widget.password != null) {}
        // widget.controller.value = TextEditingValue(
        //   text: value,
        //   selection: TextSelection.collapsed(offset: value.length),
        // );
      },

      decoration: InputDecoration(
        errorText: widget.error /*'Error message'*/,
        hintText: widget.hinText,
        focusColor: primaryColor,
        suffixIcon: widget.isBarcode == true
            ? InkWell(
                onTap: (() {
                  setState(() {
                    check = !check;
                  });
                }),
                child: Icon(
                  check ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: const BorderSide(
                width: 0.25, color: Colors.black /*color: primaryColor*/
                )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: const BorderSide(
                width: 0.25, color: Colors.black /*color: primaryColor*/
                )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: const BorderSide(
                width: 0.25,
                /*color: primaryColor*/
                color: Colors.black)),
        contentPadding:
            const EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
      keyboardType: widget.type,
    );
  }
}
