import 'package:flutter/material.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/app_navigator.dart';
import 'package:yash_sherpura_budventure_task/presentation/navigation/routes/search_routes.dart';

abstract class AppRoutes {
  static AppRoute<dynamic> movieDetailsScreen({required ResultModel movieData}) => SearchRoutes.movieDetailsScreen(
      movieData: movieData
  );
}

class AppRoute<T> {
  const AppRoute(this.name, {this.routeBuilder});

  final String name;
  final Route<T>? Function(
    BuildContext context,
    AppNavigator navigator,
  )? routeBuilder;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppRoute &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
