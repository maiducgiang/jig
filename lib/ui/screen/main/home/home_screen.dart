import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/screen/main/home/widget/grip_view_amont_question.dart';
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
      child: Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: body(context),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(children: const [
      GripViewAmountQuestion(
        status: TestStatus.doing,
      )
    ]);
  }
}
