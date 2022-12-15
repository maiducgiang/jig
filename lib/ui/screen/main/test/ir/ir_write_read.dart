import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/ui/screen/main/test/ir/cubit/ir_cubit.dart';
import 'package:jig/ui/screen/main/test/ir/cubit/ir_state.dart';
import 'package:jig/ui/shared/base_test_screen.dart';

class IrWriteReadScreen extends StatefulWidget {
  const IrWriteReadScreen({super.key, this.onPress});
  final Function(ResultStatus)? onPress;
  @override
  State<IrWriteReadScreen> createState() => _IrWriteReadScreenState();
}

class _IrWriteReadScreenState extends State<IrWriteReadScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IrCubit()..openPort(),
      child: BlocConsumer<IrCubit, IrState>(
        listener: (context, state) {
          if (state.result == ResultStatus.pass ||
              state.result == ResultStatus.fail) {
            widget.onPress?.call(state.result!);
          }
        },
        builder: (context, state) {
          return BaseTestScreen(
              resultStatus: state.result ?? ResultStatus.doing,
              title: "THU PHÁT HỒNG NGOẠI (IR)",
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
