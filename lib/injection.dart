import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jig/data/remote/dio_di.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/data/repository/main/main_repository.dart';
import 'package:jig/foundation/constant.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/shared/widget/button/toast.dart';

final getIt = GetIt.instance;
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(() => _DioDi().dio);
  getIt.registerLazySingleton<IToast>(() => CustomBotToast());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(
        getIt.get<Dio>(),
        baseUrl: ApiConstants.baseUrl,
      ));
  getIt.registerLazySingleton<MainRepository>(() => MainRepository(
        getIt.get<Dio>(),
        baseUrl: ApiConstants.baseUrl,
      ));
  getIt.registerLazySingleton<AppCubit>(() => AppCubit());
}

class _DioDi extends DioDi {}
