import 'package:equatable/equatable.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';

// Events
abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class LoadPopularMovies extends MovieEvent {
  final int page;
  const LoadPopularMovies({this.page = 1});

  @override
  List<Object> get props => [page];
}

class LoadTopRatedMovies extends MovieEvent {
  final int page;
  const LoadTopRatedMovies({this.page = 1});

  @override
  List<Object> get props => [page];
}

class LoadNowPlayingMovies extends MovieEvent {
  final int page;
  const LoadNowPlayingMovies({this.page = 1});

  @override
  List<Object> get props => [page];
}

class LoadUpcomingMovies extends MovieEvent {
  final int page;
  const LoadUpcomingMovies({this.page = 1});

  @override
  List<Object> get props => [page];
}

class SearchMovies extends MovieEvent {
  final String query;
  final int page;

  const SearchMovies({required this.query, this.page = 1});

  @override
  List<Object> get props => [query, page];
}

class RefreshMovies extends MovieEvent {}

// States
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {
  final String message;

  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviesLoaded extends MovieState {
  final List<TMDBMovie> popularMovies;
  final List<TMDBMovie> topRatedMovies;
  final List<TMDBMovie> nowPlayingMovies;
  final List<TMDBMovie> upcomingMovies;
  final List<TMDBMovie> searchResults;
  final bool isLoadingMore;
  final String? errorMessage;

  const MoviesLoaded({
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingMovies = const [],
    this.upcomingMovies = const [],
    this.searchResults = const [],
    this.isLoadingMore = false,
    this.errorMessage,
  });

  MoviesLoaded copyWith({
    List<TMDBMovie>? popularMovies,
    List<TMDBMovie>? topRatedMovies,
    List<TMDBMovie>? nowPlayingMovies,
    List<TMDBMovie>? upcomingMovies,
    List<TMDBMovie>? searchResults,
    bool? isLoadingMore,
    String? errorMessage,
  }) {
    return MoviesLoaded(
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      searchResults: searchResults ?? this.searchResults,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object> get props => [
        popularMovies,
        topRatedMovies,
        nowPlayingMovies,
        upcomingMovies,
        searchResults,
        isLoadingMore,
        errorMessage ?? '',
      ];
}
