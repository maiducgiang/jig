import 'package:flutter/material.dart';

class DividerApp extends StatelessWidget {
  const DividerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 0,
      indent: 0,
      endIndent: 0,
      color: Color(0xffe0e0e0),
    );
  }
}
