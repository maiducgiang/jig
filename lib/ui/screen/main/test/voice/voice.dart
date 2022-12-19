import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/screen/main/test/voice/cubit/voice_cubit.dart';
import 'package:jig/ui/screen/main/test/voice/cubit/voice_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VoiceCubit()..openPort(),
      child: BlocConsumer<VoiceCubit, VoiceState>(
        listener: (context, state) {
          if (state.result == ResultStatus.pass ||
              state.result == ResultStatus.fail) {
            widget.onPress?.call(state.result!);
          }
          if (state.error != "") {
            getIt.get<IToast>().show(
                title: 'Lỗi',
                message: state.error,
                hasDismissButton: true,
                duration: const Duration(milliseconds: 1000));
          }
        },
        builder: (context, state) {
          return BaseTestScreen(
              resultStatus: state.result ?? ResultStatus.doing,
              title: "VOICE",
              child: body(context));
        },
      ),
    );
  }

  Widget body(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
