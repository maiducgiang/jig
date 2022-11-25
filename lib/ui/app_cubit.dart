import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/model/user_session/user_session.dart';
import 'package:jig/ui/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  void updateUserSession(UserSession? userSession) {
    emit(state.copyWith(userSession: userSession));
  }
}
