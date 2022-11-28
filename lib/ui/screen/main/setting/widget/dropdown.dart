import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/constant.dart';

class DropdowCom extends StatefulWidget {
  DropdowCom({super.key, required this.comPorts, required this.callback});
  List<String> comPorts;

  Function(String) callback;
  @override
  State<DropdowCom> createState() => _DropdowComState();
}

class _DropdowComState extends State<DropdowCom> {
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.comPorts[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: defaultPaddingScreen),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(defaultBorderRadius)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 0,
          style: const TextStyle(color: Colors.black),
          onChanged: (String? value) {
            widget.callback(value!);
            setState(() {
              dropdownValue = value;
            });
          },
          items: widget.comPorts.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
