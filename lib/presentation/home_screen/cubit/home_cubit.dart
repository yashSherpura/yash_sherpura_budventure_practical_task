import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_interactor.dart';
import 'package:yash_sherpura_budventure_task/presentation/home_screen/cubit/home_state.dart';
import 'package:yash_sherpura_budventure_task/utility/connectivity_config/connectivity_helper.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.movieInteractor,
  }) : super(InitialHomeState());

  final MovieInteractor movieInteractor;
  List<ResultModel> resultList = [];
  List<ResultModel> upComingResultList = [];
  List<ResultModel> topRatedResultList = [];

  Future<void> nowPlayingMovie() async {
    try {
      emit(const LoadingHomeState());

      if (await ConnectivityHelper().checkConnectivity()) {
        final MovieModel nowPlayingModel =
            await movieInteractor.nowPlayingMovie();
        resultList = nowPlayingModel.resultModels;
        emit(const SuccessNowPlayingHomeState());
      } else {
        emit(
          const ErrorHomeState(error: StringConstants.msgNoInternet),
        );
      }
    } catch (e) {
      Utility.showLog('Error: $e');
      emit(ErrorHomeState(error: e));
    }
  }

  Future<void> upComingMovie() async {
    try {
      emit(const LoadingHomeState());

      if (await ConnectivityHelper().checkConnectivity()) {
        final MovieModel upComingModel =
            await movieInteractor.upcomingMovie();
        upComingResultList = upComingModel.resultModels;
        emit(const SuccessUpComingHomeState());
      } else {
        emit(
          const ErrorHomeState(error: StringConstants.msgNoInternet),
        );
      }
    } catch (e) {
      Utility.showLog('Error: $e');
      emit(ErrorHomeState(error: e));
    }
  }

  Future<void> topRatedMovie() async {
    try {
      emit(const LoadingHomeState());

      if (await ConnectivityHelper().checkConnectivity()) {
        final MovieModel topRatedModel =
            await movieInteractor.topRatedMovie();
        topRatedResultList = topRatedModel.resultModels;
        emit(const SuccessTopRatedHomeState());
      } else {
        emit(
          const ErrorHomeState(error: StringConstants.msgNoInternet),
        );
      }
    } catch (e) {
      Utility.showLog('Error: $e');
      emit(ErrorHomeState(error: e));
    }
  }
}
