import 'package:flutter/cupertino.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/shared/base_test_screen.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseTestScreen(
        resultStatus: ResultStatus.fail, title: "VOICE", child: body(context));
  }

  Widget body(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
