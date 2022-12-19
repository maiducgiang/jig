import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/enum/enum_test_status.dart';

import 'package:jig/data/model/account/account_model.dart';
import 'package:jig/data/model/question/question_model.dart';
import 'package:jig/data/model/result/result_model.dart';
import 'package:jig/data/model/user_session/user_session.dart';
import 'package:jig/data/repository/auth/auth_repository.dart';
import 'package:jig/ui/app_cubit.dart';
import 'package:jig/ui/screen/auth/signin/cubit/signin_state.dart';
import 'package:jig/ui/screen/main/test/bluetooth/bluetooth.dart';
import 'package:jig/ui/screen/main/test/bluetooth_mac/bluetooth_mac.dart';
import 'package:jig/ui/screen/main/test/calib_power/calib_power.dart';
import 'package:jig/ui/screen/main/test/calib_power_last/calib_power_last.dart';
import 'package:jig/ui/screen/main/test/info_device/info_device.dart';
import 'package:jig/ui/screen/main/test/ir/ir_write_read.dart';
import 'package:jig/ui/screen/main/test/status_button/status_button.dart';
import 'package:jig/ui/screen/main/test/status_led/status_led.dart';
import 'package:jig/ui/screen/main/test/voice/voice.dart';
import 'package:jig/ui/screen/main/test/write_barcode/write_barcode.dart';
import 'package:jig/ui/services/account_services.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:sp_util/sp_util.dart';

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
      if (response.code == 200) {
        final userToken = response.data!.token;
        final userId = response.data!.userId;
        SpUtil.putString("userToken", userToken ?? "");
        SpUtil.putInt("userId", userId ?? 0);
        AccountServices().saveUserToken(userToken!);
        print("giang$userToken");
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
