import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';

abstract class MovieProvider {
  Future<MovieModel> nowPlayingMovie();

  Future<MovieModel> upcomingMovie();

  Future<MovieModel> topRatedMovie();

  Future<MovieModel> searchMovie({required String query});
}
