import 'package:json_annotation/json_annotation.dart';
part 'now_playing_dto.g.dart';

@JsonSerializable()
class NowPlayingDto {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  NowPlayingDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingDto.fromJson(Map<String, dynamic> json) => _$NowPlayingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingDtoToJson(this);
}

@JsonSerializable()
class Result {
  final bool adult;
  final String backdropPath;
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

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
