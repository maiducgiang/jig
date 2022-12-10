import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/data/repository/main/main_repository.dart';
import 'package:jig/injection.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/router/router.gr.dart';

import 'package:jig/ui/services/account_services.dart';
import 'package:jig/ui/theme/box_decoration.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:sp_util/sp_util.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  final _apiClient = getIt.get<AuthRepository>();
  final _appCubit = getIt.get<AppCubit>();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final mainApiClient = getIt.get<MainRepository>();

  @override
  void initState() {
    checkFirtLoad();
    //context.router.push(const WelcomePage());
    super.initState();
  }

  void checkFirtLoad() async {
    final String token = await AccountServices().getUserToken();
    final String userId = await AccountServices().getUserId();
    SpUtil.putString("userToken", token);
    if (token != '' && userId != '') {
      context.router.push(const MainPage());
    } else {
      //await handleGetAccountMe();
      context.router.replace(const SignInPage());
    }
    // } else {
    //   context.router.push(const WelcomePage());
    // }
  }

  // Future<void> handleGetAccountMe() async {
  //   try {
  //     final response = await mainApiClient.getUserInfo();
  //     if (response.status == 200) {
  //       final userId = await AccountServices().getUserId();
  //       final userToken = await AccountServices().getUserToken();
  //       final userInfo = response.data!.account;
  //       final data = response.data;
  //       final isBoss = userInfo!.type == "boss" ? true : false;
  //       if (data == null) {
  //         return;
  //       }
  //       final userSession = UserSession(
  //           token: userToken,
  //           userId: userId,
  //           user: userInfo,
  //           status: userInfo.status ?? 1,
  //           isBoss: isBoss,
  //           totalOrderInThisMonth: data.totalOrderInThisMonth,
  //           totalOrderOutThisMonth: data.totalOrderOutThisMonth,
  //           totalRevenueInThisMonth: data.totalRevenueInThisMonth,
  //           totalRevenueOutThisMonth: data.totalRevenueOutThisMonth,
  //           allRevenueIn: data.allRevenueIn,
  //           allRevenueOut: data.allRevenueOut);
  //       widget._appCubit.updateUserSession(userSession);
  //       if (userInfo.profile.fullName == "") {
  //         return;
  //       } else {
  //         return;
  //       }
  //     } else {
  //       AccountServices().saveUserToken("");
  //       AccountServices().saveUserId("");
  //       return;
  //     }
  //   } on DioError catch (e) {
  //     final loginError = mainApiClient.mapDioErrorToMessage(e);
  //     AccountServices().saveUserToken("");
  //     AccountServices().saveUserId("");
  //     return;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: BlocProvider(
          create: (BuildContext context) => getIt.get<AppCubit>(),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  primaryBoxShadow,
                ],
              ),
              alignment: Alignment.center,
              child: Center(
                child: SizedBox(
                  width: 120.w,
                ),
              ))),
    );
  }
}
