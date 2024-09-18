import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yash_sherpura_budventure_task/constants/string_constants.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_interactor.dart';
import 'package:yash_sherpura_budventure_task/presentation/search_screen/cubit/search_state.dart';
import 'package:yash_sherpura_budventure_task/utility/connectivity_config/connectivity_helper.dart';
import 'package:yash_sherpura_budventure_task/utility/utility.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required this.movieInteractor,
  }) : super(InitialSearchState());

  final MovieInteractor movieInteractor;
  List<ResultModel> resultList = [];
  TextEditingController searchController = TextEditingController();

  Future<void> searchMovie({required String query}) async {
    try {
      emit(const LoadingSearchState());

      if (await ConnectivityHelper().checkConnectivity()) {
        final MovieModel searchModel =
            await movieInteractor.searchMovie(query: query);
        resultList = searchModel.resultModels;
        emit(const SuccessSearchState());
      } else {
        emit(
          const ErrorSearchState(error: StringConstants.msgNoInternet),
        );
      }
    } catch (e) {
      Utility.showLog('Error: $e');
      emit(ErrorSearchState(error: e));
    }
  }

  Future<void> refreshData() async {
    emit(RefreshLoadingState());
    emit(RefreshSuccessState());
  }
}
