import 'package:equatable/equatable.dart';

class TMDBMovie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<int> genreIds;
  final bool adult;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final bool video;

  const TMDBMovie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.genreIds,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.video,
  });

  factory TMDBMovie.fromJson(Map<String, dynamic> json) {
    return TMDBMovie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] ?? 0.0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      releaseDate: json['release_date'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      adult: json['adult'] ?? false,
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      popularity: (json['popularity'] ?? 0.0).toDouble(),
      video: json['video'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'release_date': releaseDate,
      'genre_ids': genreIds,
      'adult': adult,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'popularity': popularity,
      'video': video,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        releaseDate,
        genreIds,
        adult,
        originalLanguage,
        originalTitle,
        popularity,
        video,
      ];

  // Helper method to get full poster URL
  String get fullPosterPath {
    if (posterPath == null || posterPath!.isEmpty) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  // Helper method to get full backdrop URL
  String get fullBackdropPath {
    if (backdropPath == null || backdropPath!.isEmpty) {
      return '';
    }
    return 'https://image.tmdb.org/t/p/w1280$backdropPath';
  }
}

class TMDBMoviesResponse extends Equatable {
  final int page;
  final List<TMDBMovie> results;
  final int totalPages;
  final int totalResults;

  const TMDBMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TMDBMoviesResponse.fromJson(Map<String, dynamic> json) {
    return TMDBMoviesResponse(
      page: json['page'] ?? 1,
      results: (json['results'] as List<dynamic>?)
              ?.map((movie) => TMDBMovie.fromJson(movie))
              .toList() ??
          [],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}
