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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../screen/auth/splash/splash_screen.dart' as _i3;
import '../screen/main/home/home_screen.dart' as _i2;
import '../screen/main/main_screen.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainScreen(),
      );
    },
    HomePage.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    SplashPage.name: (routeData) {
      final args = routeData.argsAs<SplashPageArgs>(
          orElse: () => const SplashPageArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SplashScreen(key: args.key),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MainPage.name,
          path: '/MainPage',
        ),
        _i4.RouteConfig(
          HomePage.name,
          path: '/HomePage',
        ),
        _i4.RouteConfig(
          SplashPage.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.MainScreen]
class MainPage extends _i4.PageRouteInfo<void> {
  const MainPage()
      : super(
          MainPage.name,
          path: '/MainPage',
        );

  static const String name = 'MainPage';
}

/// generated route for
/// [_i2.HomeScreen]
class HomePage extends _i4.PageRouteInfo<void> {
  const HomePage()
      : super(
          HomePage.name,
          path: '/HomePage',
        );

  static const String name = 'HomePage';
}

/// generated route for
/// [_i3.SplashScreen]
class SplashPage extends _i4.PageRouteInfo<SplashPageArgs> {
  SplashPage({_i5.Key? key})
      : super(
          SplashPage.name,
          path: '/',
          args: SplashPageArgs(key: key),
        );

  static const String name = 'SplashPage';
}

class SplashPageArgs {
  const SplashPageArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SplashPageArgs{key: $key}';
  }
}
