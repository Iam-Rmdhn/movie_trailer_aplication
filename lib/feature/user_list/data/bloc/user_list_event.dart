import 'package:equatable/equatable.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';

// Events
abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class LoadUserList extends UserListEvent {}

class AddMovieToList extends UserListEvent {
  final TMDBMovie movie;

  const AddMovieToList(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveMovieFromList extends UserListEvent {
  final int movieId;

  const RemoveMovieFromList(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class CheckMovieInList extends UserListEvent {
  final int movieId;

  const CheckMovieInList(this.movieId);

  @override
  List<Object> get props => [movieId];
}

// States
abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<TMDBMovie> movies;
  final Set<int> movieIds;

  const UserListLoaded({
    required this.movies,
    required this.movieIds,
  });

  @override
  List<Object> get props => [movies, movieIds];

  UserListLoaded copyWith({
    List<TMDBMovie>? movies,
    Set<int>? movieIds,
  }) {
    return UserListLoaded(
      movies: movies ?? this.movies,
      movieIds: movieIds ?? this.movieIds,
    );
  }
}

class UserListError extends UserListState {
  final String message;

  const UserListError(this.message);

  @override
  List<Object> get props => [message];
}
