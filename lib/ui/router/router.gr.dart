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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../screen/auth/signin/signin.dart' as _i4;
import '../screen/auth/splash/splash_screen.dart' as _i5;
import '../screen/main/home/home_screen.dart' as _i2;
import '../screen/main/main_screen.dart' as _i3;
import '../screen/main/setting/setting.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SettingPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SettingScreen(),
      );
    },
    HomePage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    MainPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    SignInPage.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignInScreen(),
      );
    },
    SplashPage.name: (routeData) {
      final args = routeData.argsAs<SplashPageArgs>(
          orElse: () => const SplashPageArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.SplashScreen(key: args.key),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SettingPage.name,
          path: '/SettingPage',
        ),
        _i6.RouteConfig(
          HomePage.name,
          path: '/HomePage',
        ),
        _i6.RouteConfig(
          MainPage.name,
          path: '/MainPage',
        ),
        _i6.RouteConfig(
          SignInPage.name,
          path: '/SignInPage',
        ),
        _i6.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.SettingScreen]
class SettingPage extends _i6.PageRouteInfo<void> {
  const SettingPage()
      : super(
          SettingPage.name,
          path: '/SettingPage',
        );

  static const String name = 'SettingPage';
}

/// generated route for
/// [_i2.HomeScreen]
class HomePage extends _i6.PageRouteInfo<void> {
  const HomePage()
      : super(
          HomePage.name,
          path: '/HomePage',
        );

  static const String name = 'HomePage';
}

/// generated route for
/// [_i3.MainScreen]
class MainPage extends _i6.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/MainPage',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i4.SignInScreen]
class SignInPage extends _i6.PageRouteInfo<void> {
  const SignInPage()
      : super(
          SignInPage.name,
          path: '/SignInPage',
        );

  static const String name = 'SignInPage';
}

/// generated route for
/// [_i5.SplashScreen]
class SplashPage extends _i6.PageRouteInfo<SplashPageArgs> {
  SplashPage({_i7.Key? key})
      : super(
          SplashPage.name,
          path: '/',
          args: SplashPageArgs(key: key),
        );

  static const String name = 'SplashPage';
}

class SplashPageArgs {
  const SplashPageArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SplashPageArgs{key: $key}';
  }
}
