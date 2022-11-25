
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/repository/main/main_repository.dart';
import 'package:jig/ui/screen/main/profile/cubit/profile_state.dart';

import 'package:path/path.dart' as p;

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._apiMain) : super(ProfileState.initial());
  final MainRepository _apiMain;
  //Future<SigninResponse?> signin({required String phone}) async

}
