import 'package:injector/injector.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_interactor.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_provider.dart';

class DomainModule {
  static MovieInteractor createMovieInteractor(
    Injector injector,
  ) =>
      MovieInteractor(
        movieProvider: injector.get<MovieProvider>(),
      );
}
