import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/now_playing_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/search_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/top_rated_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/up_coming_movie_dto.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {required String baseUrl}) = _ApiClient;

  @GET('/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_release_type=2|3&release_date.gte={min_date}&release_date.lte={max_date}')
  Future<NowPlayingDto> nowPlayingMovie();

  @GET('/movie/upcoming?language=en-US&page=1')
  Future<UpcomingMovieDto> upComingMovie();

  @GET('/movie/top_rated?language=en-US&page=1')
  Future<TopRatedMovieDto> topRatedMovie();

  @GET('/search/movie?query=&include_adult=false&language=en-US&page=1')
  Future<SearchMovieDto> searchMovie({
    @Query('query') required String query,
  });
}
