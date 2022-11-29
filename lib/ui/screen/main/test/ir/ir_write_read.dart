import 'package:flutter/cupertino.dart';
import 'package:jig/ui/shared/base_test_screen.dart';

class IrWriteReadScreen extends StatefulWidget {
  const IrWriteReadScreen({super.key});

  @override
  State<IrWriteReadScreen> createState() => _IrWriteReadScreenState();
}

class _IrWriteReadScreenState extends State<IrWriteReadScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(
        title: "THU PHÁT HỒNG NGOẠI (IR)", child: body(context));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
