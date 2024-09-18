import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_provider.dart';

class MovieInteractor {
  MovieInteractor({
    required this.movieProvider,
  });

  final MovieProvider movieProvider;

  Future<MovieModel> nowPlayingMovie() async {
    return movieProvider.nowPlayingMovie();
  }

  Future<MovieModel> upcomingMovie() async {
    return movieProvider.upcomingMovie();
  }

  Future<MovieModel> topRatedMovie() async {
    return movieProvider.topRatedMovie();
  }

  Future<MovieModel> searchMovie({required String query}) async {
    return movieProvider.searchMovie(query: query);
  }
}
