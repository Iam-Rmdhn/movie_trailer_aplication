import 'package:equatable/equatable.dart';
import 'package:movie_app/core/data/models/movie_detail.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';

// Events
abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadMovieDetail extends MovieDetailEvent {
  final int movieId;

  const LoadMovieDetail({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class LoadMovieCredits extends MovieDetailEvent {
  final int movieId;

  const LoadMovieCredits({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class LoadMovieVideos extends MovieDetailEvent {
  final int movieId;

  const LoadMovieVideos({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class LoadSimilarMovies extends MovieDetailEvent {
  final int movieId;
  final int page;

  const LoadSimilarMovies({required this.movieId, this.page = 1});

  @override
  List<Object> get props => [movieId, page];
}

class LoadRecommendations extends MovieDetailEvent {
  final int movieId;
  final int page;

  const LoadRecommendations({required this.movieId, this.page = 1});

  @override
  List<Object> get props => [movieId, page];
}

class RefreshMovieDetail extends MovieDetailEvent {
  final int movieId;

  const RefreshMovieDetail({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

// States
abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieDetail;
  final MovieCredits? credits;
  final MovieVideos? videos;
  final List<TMDBMovie> similarMovies;
  final List<TMDBMovie> recommendations;
  final bool isLoadingCredits;
  final bool isLoadingVideos;
  final bool isLoadingSimilar;
  final bool isLoadingRecommendations;
  final String? creditsError;
  final String? videosError;
  final String? similarError;
  final String? recommendationsError;

  const MovieDetailLoaded({
    required this.movieDetail,
    this.credits,
    this.videos,
    this.similarMovies = const [],
    this.recommendations = const [],
    this.isLoadingCredits = false,
    this.isLoadingVideos = false,
    this.isLoadingSimilar = false,
    this.isLoadingRecommendations = false,
    this.creditsError,
    this.videosError,
    this.similarError,
    this.recommendationsError,
  });

  MovieDetailLoaded copyWith({
    MovieDetail? movieDetail,
    MovieCredits? credits,
    MovieVideos? videos,
    List<TMDBMovie>? similarMovies,
    List<TMDBMovie>? recommendations,
    bool? isLoadingCredits,
    bool? isLoadingVideos,
    bool? isLoadingSimilar,
    bool? isLoadingRecommendations,
    String? creditsError,
    String? videosError,
    String? similarError,
    String? recommendationsError,
  }) {
    return MovieDetailLoaded(
      movieDetail: movieDetail ?? this.movieDetail,
      credits: credits ?? this.credits,
      videos: videos ?? this.videos,
      similarMovies: similarMovies ?? this.similarMovies,
      recommendations: recommendations ?? this.recommendations,
      isLoadingCredits: isLoadingCredits ?? this.isLoadingCredits,
      isLoadingVideos: isLoadingVideos ?? this.isLoadingVideos,
      isLoadingSimilar: isLoadingSimilar ?? this.isLoadingSimilar,
      isLoadingRecommendations:
          isLoadingRecommendations ?? this.isLoadingRecommendations,
      creditsError: creditsError,
      videosError: videosError,
      similarError: similarError,
      recommendationsError: recommendationsError,
    );
  }

  @override
  List<Object> get props => [
        movieDetail,
        credits ?? 'null_credits',
        videos ?? 'null_videos',
        similarMovies,
        recommendations,
        isLoadingCredits,
        isLoadingVideos,
        isLoadingSimilar,
        isLoadingRecommendations,
        creditsError ?? '',
        videosError ?? '',
        similarError ?? '',
        recommendationsError ?? '',
      ];
}
