// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMovieDto _$TopRatedMovieDtoFromJson(Map<String, dynamic> json) =>
    TopRatedMovieDto(
      page: (json['page'] as num).toInt(),
      topRatedResultDtos: (json['results'] as List<dynamic>)
          .map((e) => TopRatedResultDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num).toInt(),
      totalTopRatedResultDtos: (json['total_results'] as num).toInt(),
    );

Map<String, dynamic> _$TopRatedMovieDtoToJson(TopRatedMovieDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.topRatedResultDtos.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalTopRatedResultDtos,
    };

TopRatedResultDto _$TopRatedResultDtoFromJson(Map<String, dynamic> json) =>
    TopRatedResultDto(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
    );

Map<String, dynamic> _$TopRatedResultDtoToJson(TopRatedResultDto instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
