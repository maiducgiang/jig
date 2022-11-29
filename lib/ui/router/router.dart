import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:jig/ui/router/app_router.dart';
import 'package:jig/ui/screen/auth/signin/signin.dart';
import 'package:jig/ui/screen/auth/splash/splash_screen.dart';
import 'package:jig/ui/screen/main/home/home_screen.dart';
import 'package:jig/ui/screen/main/main_screen.dart';
import 'package:jig/ui/screen/main/setting/setting.dart';
import 'package:jig/ui/screen/main/setting/setting_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SettingScreen,
      name: "SettingPage",
      path: "/SettingPage", /*initial: true*/
    ),
    AutoRoute(page: HomeScreen, name: "HomePage", path: "/HomePage"),
    AutoRoute(page: MainScreen, name: "MainPage", path: "/MainPage"),
    AutoRoute(page: SignInScreen, name: "SignInPage", path: "/SignInPage"),
    AutoRoute(
        page: SplashScreen,
        name: "SplashPage",
        path: AppRoutes.splashScreen,
        initial: true),
    AutoRoute(
        page: SettingPrimaryScreen,
        name: "SettingPrimaryPage",
        path: "/SettingPrimaryPage")
  ],
)
class $AppRouter {}

Widget slideBottomToTop(context, animation, secondaryAnimation, child) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  const curve = Curves.fastLinearToSlowEaseIn;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return SlideTransition(
    position: animation.drive(tween),
    child: child,
  );
}
