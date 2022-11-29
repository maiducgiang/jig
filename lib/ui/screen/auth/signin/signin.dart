import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/model/account/account_model.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/loading_screen.dart';
import 'package:jig/ui/router/router.gr.dart';
import 'package:jig/ui/screen/auth/signin/cubit/signin_cubit.dart';
import 'package:jig/ui/screen/auth/signin/cubit/signin_state.dart';
import 'package:jig/ui/shared/widget/button/primary_button.dart';
import 'package:jig/ui/shared/widget/text_field/text_form_field.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

import '../../../../data/repository/auth/auth_repository.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? error;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: backgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 553.w,
              // height: 693.h,
              decoration: const BoxDecoration(color: Colors.white),
              child: body(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPaddingScreen * 6),
      child: BlocProvider(
        create: (context) =>
            SigninCubit(getIt.get<AuthRepository>(), getIt.get<AppCubit>()),
        child: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            //if (state.isLoading == true) return const LoadingScreen();
            return Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultPaddingScreen * 3,
                    ),
                    SizedBox(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "JIG TEST",
                          textAlign: TextAlign.center,
                          style: primaryHeaderTitleStyle.copyWith(
                              fontSize: 48.sp,
                              color: primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: defaultPaddingScreen * 2,
                    ),
                    Text(
                      "Tên đăng nhập",
                      style: primaryTitleStyle.copyWith(
                        fontSize: 32.sp,
                      ),
                    ),
                    SizedBox(
                      height: defaultPaddingScreen,
                    ),
                    TextFormFieldInput(
                        error: error,
                        maxLine: 1,
                        controller: emailController,
                        hinText: "email"),
                    SizedBox(
                      height: defaultPaddingScreen,
                    ),
                    Text(
                      "Mật khẩu",
                      style: primaryTitleStyle.copyWith(fontSize: 32.sp),
                    ),
                    SizedBox(
                      height: defaultPaddingScreen,
                    ),
                    TextFormFieldInput(
                        error: error,
                        maxLine: 1,
                        controller: passController,
                        hinText: "password"),
                    SizedBox(
                      height: defaultPaddingScreen * 2,
                    ),
                    state.isLoading == true
                        ? Container(
                            alignment: Alignment.center,
                            height: 72.h,
                            child: const CircularProgressIndicator(),
                          )
                        : PrimaryButton(
                            label: "Đăng nhập",
                            backgroundColor: primaryColor,
                            onPressed: (() async {
                              if (_formKey.currentState!.validate() == true) {
                                bool? check = await context
                                    .read<SigninCubit>()
                                    .getLoginEmail(
                                        email: emailController.text,
                                        pass: passController.text);
                                if (check == true) {
                                  context.router.push(const MainPage());
                                } else {
                                  setState(() {
                                    error = state.error;
                                  });
                                  setState(() {
                                    error = state.error;
                                  });
                                }
                              }
                            }),
                          ),
                    SizedBox(
                      height: defaultPaddingScreen * 2,
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
