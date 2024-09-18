import 'package:json_annotation/json_annotation.dart';
part 'search_movie_dto.g.dart';

@JsonSerializable()
class SearchMovieDto {
  final int page;
  @JsonKey(name: "results")
  final List<SearchResultDto> searchResultDtos;
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalSearchResultDtos;

  SearchMovieDto({
    required this.page,
    required this.searchResultDtos,
    required this.totalPages,
    required this.totalSearchResultDtos,
  });

  factory SearchMovieDto.fromJson(Map<String, dynamic> json) => _$SearchMovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieDtoToJson(this);
}

@JsonSerializable()
class SearchResultDto {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  SearchResultDto({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SearchResultDto.fromJson(Map<String, dynamic> json) => _$SearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDtoToJson(this);
}
