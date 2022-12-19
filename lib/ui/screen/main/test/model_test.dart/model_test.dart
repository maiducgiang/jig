import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/loading_screen.dart';
import 'package:jig/ui/screen/main/test/model_test.dart/cubit/model_test_cubit.dart';
import 'package:jig/ui/screen/main/test/model_test.dart/cubit/model_test_state.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class ModelTestScreen extends StatefulWidget {
  const ModelTestScreen({super.key, required this.onPress});
  final Function onPress;
  @override
  State<ModelTestScreen> createState() => _ModelTestScreenState();
}

class _ModelTestScreenState extends State<ModelTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: body(context),
    );
  }

  Widget body(BuildContext buildContext) {
    return BlocProvider(
      create: (context) => ModelTestCubit(),
      child: BlocConsumer<ModelTestCubit, ModelTestState>(
        listener: (context, state) {
          if (state.result == true) {
            widget.onPress.call();
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
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: defaultPaddingScreen * 2,
                    ),
                    Text(
                      "MODEL TEST: MODEL 1234ABC",
                      style:
                          primaryHeaderTitleStyle.copyWith(color: Colors.black),
                    ),
                    // SizedBox(
                    //   height: defaultPaddingScreen,
                    // ),
                    Text(
                      "Quét Barcode in trên mạch để bắt đầu test",
                      style: primaryTitleStyle.copyWith(color: contentColor),
                    ),
                    SizedBox(
                      height: defaultPaddingScreen * 2,
                    ),
                    SizedBox(
                      width: 500.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Serial Code",
                            style: primaryTitleStyle.copyWith(),
                          ),
                          SizedBox(
                            height: defaultPaddingScreen,
                          ),
                          TextFormFieldInput(
                              isBarcode: true,
                              controller: TextEditingController(),
                              hinText: ""),
                          SizedBox(
                            height: defaultPaddingScreen,
                          ),
                          state.isLoading == true
                              ? Container(
                                  height: 72.h,
                                  decoration: const BoxDecoration(),
                                  child: const LoadingScreen(),
                                )
                              : (state.error == ""
                                  ? PrimaryButton(
                                      label: "Bắt đầu test",
                                      backgroundColor: primaryColor3,
                                      onPressed: (() async {
                                        await context
                                            .read<ModelTestCubit>()
                                            .openPort();
                                      }),
                                    )
                                  : PrimaryButton(
                                      label:
                                          state.error ?? "Kết quả sai, thử lại",
                                      backgroundColor: errorColor,
                                      onPressed: (() async {
                                        await context
                                            .read<ModelTestCubit>()
                                            .openPort();
                                        // if (state.result == true) {
                                        //   widget.onPress.call();
                                        // }
                                      }),
                                    ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 70.h,
                decoration: BoxDecoration(color: Colors.grey[350]),
                //child: const LoadingScreen(),
              )
            ],
          );
        },
      ),
    );
  }
}
