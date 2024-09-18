import 'package:yash_sherpura_budventure_task/data/movie/mapper/movie_mapper.dart';
import 'package:yash_sherpura_budventure_task/data/network/api/api_client.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/now_playing_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/search_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/top_rated_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/up_coming_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/movie_provider.dart';

class NetworkMovieProvider extends MovieProvider {
  NetworkMovieProvider({
    required this.apiClient,
    required this.movieMapper,
  });

  final ApiClient apiClient;
  final MovieMapper movieMapper;

  @override
  Future<MovieModel> nowPlayingMovie() async {
    final NowPlayingDto dto = await apiClient.nowPlayingMovie();
    return movieMapper.mapNowPlayingDtoToModel(dto);
  }

  @override
  Future<MovieModel> upcomingMovie() async {
    final UpcomingMovieDto dto = await apiClient.upComingMovie();
    return movieMapper.mapUpcomingDtoToModel(dto);
  }

  @override
  Future<MovieModel> topRatedMovie() async {
    final TopRatedMovieDto dto = await apiClient.topRatedMovie();
    return movieMapper.mapTopRatedDtoToModel(dto);
  }

  @override
  Future<MovieModel> searchMovie({required String query}) async {
    final SearchMovieDto dto = await apiClient.searchMovie(query: query);
    return movieMapper.mapSearchDtoToModel(dto);
  }
}
