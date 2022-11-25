import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/theme/constant.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.controller, this.onPress})
      : super(key: key);
  final TextEditingController controller;
  final Function()? onPress;
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: true,
      autofocus: false,
      autofillHints: const [AutofillHints.oneTimeCode],
      //validator: (text) {},
      controller: widget.controller,
      onChanged: (value) {
        widget.controller.value = TextEditingValue(
          text: value,
          selection: TextSelection.collapsed(offset: value.length),
        );
      },
      cursorColor: Colors.grey, //: Colors.grey[700],
      decoration: InputDecoration(
        //errorText: widget.state.error /*'Error message'*/,
        hintText: "Tìm kiếm",
        focusColor: primaryColor,
        suffixIcon: InkWell(
          onTap: (() {
            widget.onPress;
          }),
          child: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(
              width: 1.w,
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius),
            borderSide: BorderSide(width: 1.w, color: Colors.grey)),
        contentPadding:
            EdgeInsets.only(top: 20.h, bottom: 0, left: 20.w, right: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
      ),
    );
  }
}
