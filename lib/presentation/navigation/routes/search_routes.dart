import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_navigator.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_routes.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/helpers/custom_route.dart';
import 'package:yash_sherpura_budventure_task/presentation/search_screen/widgets/movie_details_widget.dart';

abstract class SearchRoutes {
  static AppRoute<dynamic> movieDetailsScreen({required ResultModel movieData}) => AppRoute<dynamic>(
        'movie_details_screen',
        routeBuilder: (BuildContext context, AppNavigator appNavigator) {
          return CustomRoute<dynamic>(
            appNavigator: appNavigator,
            builder: (_) =>  MovieDetailsWidget(
                movieData: movieData
            ),
          );
        },
      );
}
