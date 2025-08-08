import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helper/storage_helper.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_event.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitial()) {
    on<LoadUserList>(_onLoadUserList);
    on<AddMovieToList>(_onAddMovieToList);
    on<RemoveMovieFromList>(_onRemoveMovieFromList);
    on<CheckMovieInList>(_onCheckMovieInList);
  }

  Future<void> _onLoadUserList(
    LoadUserList event,
    Emitter<UserListState> emit,
  ) async {
    try {
      emit(UserListLoading());

      final movies = await StorageHelper.getUserListMovies();
      final movieIds = movies.map((movie) => movie.id).toSet();

      emit(UserListLoaded(
        movies: movies,
        movieIds: movieIds,
      ));
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  Future<void> _onAddMovieToList(
    AddMovieToList event,
    Emitter<UserListState> emit,
  ) async {
    try {
      if (state is UserListLoaded) {
        final currentState = state as UserListLoaded;

        // Check if movie already exists
        if (currentState.movieIds.contains(event.movie.id)) {
          return;
        }

        final updatedMovies = [...currentState.movies, event.movie];
        final updatedIds = {...currentState.movieIds, event.movie.id};

        // Save to storage
        await StorageHelper.saveUserListMovies(updatedMovies);

        emit(currentState.copyWith(
          movies: updatedMovies,
          movieIds: updatedIds,
        ));
      }
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  Future<void> _onRemoveMovieFromList(
    RemoveMovieFromList event,
    Emitter<UserListState> emit,
  ) async {
    try {
      if (state is UserListLoaded) {
        final currentState = state as UserListLoaded;

        final updatedMovies = currentState.movies
            .where((movie) => movie.id != event.movieId)
            .toList();
        final updatedIds = Set<int>.from(currentState.movieIds)
          ..remove(event.movieId);

        // Save to storage
        await StorageHelper.saveUserListMovies(updatedMovies);

        emit(currentState.copyWith(
          movies: updatedMovies,
          movieIds: updatedIds,
        ));
      }
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  Future<void> _onCheckMovieInList(
    CheckMovieInList event,
    Emitter<UserListState> emit,
  ) async {
    // This event is handled by the current state, no action needed
  }

  bool isMovieInList(int movieId) {
    if (state is UserListLoaded) {
      return (state as UserListLoaded).movieIds.contains(movieId);
    }
    return false;
  }
}
