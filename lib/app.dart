import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/router/router.gr.dart';

import 'injection.dart';

final _appRouter = AppRouter();
final _botToastBuilder = BotToastInit();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1023),
      builder: (context, _) => MaterialApp.router(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale("vi")],
        locale: const Locale('vi'),
        title: 'Leader',
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
        builder: EasyLoading.init(
            builder: (context, widget) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => getIt.get<AppCubit>()),
                  ],
                  child: _botToastBuilder(context, widget),
                )),
      ),
    );
  }
}
