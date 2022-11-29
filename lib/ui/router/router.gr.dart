// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../screen/auth/signin/signin.dart' as _i4;
import '../screen/auth/splash/splash_screen.dart' as _i5;
import '../screen/main/home/home_screen.dart' as _i2;
import '../screen/main/main_screen.dart' as _i3;
import '../screen/main/setting/setting.dart' as _i1;
import '../screen/main/setting/setting_screen.dart' as _i6;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SettingPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SettingScreen(),
      );
    },
    HomePage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    MainPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    SignInPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignInScreen(),
      );
    },
    SplashPage.name: (routeData) {
      final args = routeData.argsAs<SplashPageArgs>(
          orElse: () => const SplashPageArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SplashScreen(key: args.key),
      );
    },
    SettingPrimaryPage.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingPrimaryScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SettingPage.name,
          path: '/SettingPage',
        ),
        _i7.RouteConfig(
          HomePage.name,
          path: '/HomePage',
        ),
        _i7.RouteConfig(
          MainPage.name,
          path: '/MainPage',
        ),
        _i7.RouteConfig(
          SignInPage.name,
          path: '/SignInPage',
        ),
        _i7.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
        _i7.RouteConfig(
          SettingPrimaryPage.name,
          path: '/SettingPrimaryPage',
        ),
      ];
}

/// generated route for
/// [_i1.SettingScreen]
class SettingPage extends _i7.PageRouteInfo<void> {
  const SettingPage()
      : super(
          SettingPage.name,
          path: '/SettingPage',
        );

  static const String name = 'SettingPage';
}

/// generated route for
/// [_i2.HomeScreen]
class HomePage extends _i7.PageRouteInfo<void> {
  const HomePage()
      : super(
          HomePage.name,
          path: '/HomePage',
        );

  static const String name = 'HomePage';
}

/// generated route for
/// [_i3.MainScreen]
class MainPage extends _i7.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/MainPage',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i4.SignInScreen]
class SignInPage extends _i7.PageRouteInfo<void> {
  const SignInPage()
      : super(
          SignInPage.name,
          path: '/SignInPage',
        );

  static const String name = 'SignInPage';
}

/// generated route for
/// [_i5.SplashScreen]
class SplashPage extends _i7.PageRouteInfo<SplashPageArgs> {
  SplashPage({_i8.Key? key})
      : super(
          SplashPage.name,
          path: '/',
          args: SplashPageArgs(key: key),
        );

  static const String name = 'SplashPage';
}

class SplashPageArgs {
  const SplashPageArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SplashPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SettingPrimaryScreen]
class SettingPrimaryPage extends _i7.PageRouteInfo<void> {
  const SettingPrimaryPage()
      : super(
          SettingPrimaryPage.name,
          path: '/SettingPrimaryPage',
        );

  static const String name = 'SettingPrimaryPage';
}
