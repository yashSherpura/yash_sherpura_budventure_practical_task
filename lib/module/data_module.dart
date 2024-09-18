import 'package:injector/injector.dart';
import 'package:yash_sherpura_budventure_task/data/movie/mapper/movie_mapper.dart';
import 'package:yash_sherpura_budventure_task/data/movie/network_movie_provider.dart';
import 'package:yash_sherpura_budventure_task/data/network/api/api_client.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_provider.dart';

class DataModule {
  static MovieProvider movieProvider(Injector injector) => NetworkMovieProvider(
        apiClient: injector.get<ApiClient>(),
        movieMapper: injector.get<MovieMapper>(),
      );

  static MovieMapper createNowPlayingMapper(Injector injector) =>
      const MovieMapper();
}
