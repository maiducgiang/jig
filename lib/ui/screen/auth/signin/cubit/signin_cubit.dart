import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jig/data/model/account/account_model.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/ui/screen/auth/signin/cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._apiAuth) : super(SigninState.initial());
  final AuthRepository _apiAuth;
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
        emit(state.copyWith(isLoading: false));
        return true;
      } else {
        emit(state.copyWith(isLoading: true, error: response.message));
        return false;
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
      return false;
    }
  }
}
