import 'package:json_annotation/json_annotation.dart';
part 'top_rated_movie_dto.g.dart';

@JsonSerializable()
class TopRatedMovieDto {
  final int page;
  @JsonKey(name: "results")
  final List<TopRatedResultDto> topRatedResultDtos;
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalTopRatedResultDtos;

  TopRatedMovieDto({
    required this.page,
    required this.topRatedResultDtos,
    required this.totalPages,
    required this.totalTopRatedResultDtos,
  });

  factory TopRatedMovieDto.fromJson(Map<String, dynamic> json) => _$TopRatedMovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMovieDtoToJson(this);
}

@JsonSerializable()
class TopRatedResultDto {
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

  TopRatedResultDto({
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

  factory TopRatedResultDto.fromJson(Map<String, dynamic> json) => _$TopRatedResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedResultDtoToJson(this);
}
