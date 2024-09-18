import 'package:json_annotation/json_annotation.dart';
part 'up_coming_movie_dto.g.dart';

@JsonSerializable()
class UpcomingMovieDto {
  final int page;
  @JsonKey(name: "results")
  final List<UpcomingResultDto> upcomingResultDtos;
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalUpcomingResultDtos;

  UpcomingMovieDto({
    required this.page,
    required this.upcomingResultDtos,
    required this.totalPages,
    required this.totalUpcomingResultDtos,
  });

  factory UpcomingMovieDto.fromJson(Map<String, dynamic> json) => _$UpcomingMovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMovieDtoToJson(this);
}

@JsonSerializable()
class UpcomingResultDto {
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

  UpcomingResultDto({
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

  factory UpcomingResultDto.fromJson(Map<String, dynamic> json) => _$UpcomingResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingResultDtoToJson(this);
}
