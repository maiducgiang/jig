import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jig/data/model/account/account_model.dart';
import 'package:jig/data/model/user_session/user_session.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/screen/auth/signin/cubit/signin_state.dart';
import 'package:jig/ui/services/account_services.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._apiAuth, this.appCubit) : super(SigninState.initial());
  final AuthRepository _apiAuth;
  final AppCubit appCubit;
  Future<bool?> getLoginEmail(
      {required String email, required String pass}) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _apiAuth.login(AccountRequest(
        password: pass,
        email: email,
      ));
      // ignore: unrelated_type_equality_checks
      if (response.code == 200) {
        final userToken = response.data!.token;
        final userId = response.data!.userId;

        AccountServices().saveUserToken(userToken!);
        AccountServices().saveUserId(userId.toString());
        final userSession =
            UserSession(token: userToken, userId: userId!, status: 200);
        appCubit.updateUserSession(userSession);
        emit(state.copyWith(isLoading: false));
        return true;
      } else {
        emit(state.copyWith(isLoading: true, error: response.message));
        return false;
      }
    } on DioError catch (e) {
      final errorMessage = _apiAuth.mapDioErrorToMessage(e);
      emit(state.copyWith(isLoading: false, error: errorMessage));
      return null;
    }
  }
}
