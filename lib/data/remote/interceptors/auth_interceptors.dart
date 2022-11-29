import 'package:dio/dio.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/services/account_services.dart';

class AuthInterceptor extends Interceptor {
  // Don't need stream subscription cause everytime we request, we get token
  // from cubit state and apply it to the request's header
  final AppCubit _appCubit;

  AuthInterceptor(this._appCubit);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    //  AppLog.info('---> ${request.method} ${request.url}');
    final userToken = await AccountServices().getUserToken();
    options.headers['X-Requested-With'] = 'XMLHttpRequest';
    options.headers['Authorization'] = 'Bearer $userToken';
    //options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }
}
