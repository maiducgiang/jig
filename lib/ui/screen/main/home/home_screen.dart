import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/shared/base_screen.dart';
import 'package:jig/ui/theme/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreenWindow(
      child: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 88.h,
          height: double.infinity,
          decoration: const BoxDecoration(color: backgroundColor),
        )
      ],
    );
  }
}
