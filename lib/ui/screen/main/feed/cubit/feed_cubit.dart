import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/repository/main/main_repository.dart';

import 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final MainRepository _apiClient;
  FeedCubit(this._apiClient) : super(FeedState.initial());

}
