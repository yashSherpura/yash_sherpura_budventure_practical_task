import 'package:yash_sherpura_budventure_task/data/network/dto/now_playing_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/search_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/top_rated_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/data/network/dto/up_coming_movie_dto.dart';
import 'package:yash_sherpura_budventure_task/domain/movie/model/now_playing_model.dart';

class MovieMapper {
  const MovieMapper();

  /// Now playing movie mapper
  MovieModel mapNowPlayingDtoToModel(NowPlayingDto dto) {
    return MovieModel(
        page: dto.page,
        totalPages: dto.totalPages,
        totalResults: dto.totalResults,
        resultModels: mapNowPlayingResultDtoToModel(dto.results));
  }

  List<ResultModel> mapNowPlayingResultDtoToModel(List<Result> dtoList) {
    final List<ResultModel> list = <ResultModel>[];
    for (final Result dto in dtoList) {
      list.add(
        ResultModel(
            id: dto.id,
            adult: dto.adult,
            backdropPath: dto.backdropPath,
            genreIds: dto.genreIds,
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalTitle,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.releaseDate,
            title: dto.title,
            video: dto.video,
            voteAverage: dto.voteAverage,
            voteCount: dto.voteCount),
      );
    }
    return list;
  }

  /// Upcoming movie mapper
  MovieModel mapUpcomingDtoToModel(UpcomingMovieDto dto) {
    return MovieModel(
        page: dto.page,
        totalPages: dto.totalPages,
        totalResults: dto.totalUpcomingResultDtos,
        resultModels: mapUpcomingResultDtoToModel(dto.upcomingResultDtos));
  }

  List<ResultModel> mapUpcomingResultDtoToModel(List<UpcomingResultDto> dtoList) {
    final List<ResultModel> list = <ResultModel>[];
    for (final UpcomingResultDto dto in dtoList) {
      list.add(
        ResultModel(
            id: dto.id,
            adult: dto.adult,
            backdropPath: dto.backdropPath ?? '',
            genreIds: dto.genreIds,
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalTitle,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.releaseDate,
            title: dto.title,
            video: dto.video,
            voteAverage: dto.voteAverage,
            voteCount: dto.voteCount),
      );
    }
    return list;
  }

  /// Top Rated movie mapper
  MovieModel mapTopRatedDtoToModel(TopRatedMovieDto dto) {
    return MovieModel(
        page: dto.page,
        totalPages: dto.totalPages,
        totalResults: dto.totalTopRatedResultDtos,
        resultModels: mapTopRatedResultDtoToModel(dto.topRatedResultDtos));
  }

  List<ResultModel> mapTopRatedResultDtoToModel(List<TopRatedResultDto> dtoList) {
    final List<ResultModel> list = <ResultModel>[];
    for (final TopRatedResultDto dto in dtoList) {
      list.add(
        ResultModel(
            id: dto.id,
            adult: dto.adult,
            backdropPath: dto.backdropPath ?? '',
            genreIds: dto.genreIds,
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalTitle,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.releaseDate,
            title: dto.title,
            video: dto.video,
            voteAverage: dto.voteAverage,
            voteCount: dto.voteCount),
      );
    }
    return list;
  }

  /// Search movie mapper
  MovieModel mapSearchDtoToModel(SearchMovieDto dto) {
    return MovieModel(
        page: dto.page,
        totalPages: dto.totalPages,
        totalResults: dto.totalSearchResultDtos,
        resultModels: mapSearchResultDtoToModel(dto.searchResultDtos));
  }

  List<ResultModel> mapSearchResultDtoToModel(List<SearchResultDto> dtoList) {
    final List<ResultModel> list = <ResultModel>[];
    for (final SearchResultDto dto in dtoList) {
      list.add(
        ResultModel(
            id: dto.id,
            adult: dto.adult,
            backdropPath: dto.backdropPath ?? '',
            genreIds: dto.genreIds,
            originalLanguage: dto.originalLanguage,
            originalTitle: dto.originalTitle,
            overview: dto.overview,
            popularity: dto.popularity,
            posterPath: dto.posterPath,
            releaseDate: dto.releaseDate,
            title: dto.title,
            video: dto.video,
            voteAverage: dto.voteAverage,
            voteCount: dto.voteCount),
      );
    }
    return list;
  }
}
