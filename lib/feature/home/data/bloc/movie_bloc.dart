import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/data/services/movie_api_service.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApiService _apiService;

  MovieBloc(this._apiService) : super(MovieInitial()) {
    on<LoadPopularMovies>(_onLoadPopularMovies);
    on<LoadTopRatedMovies>(_onLoadTopRatedMovies);
    on<LoadNowPlayingMovies>(_onLoadNowPlayingMovies);
    on<LoadUpcomingMovies>(_onLoadUpcomingMovies);
    on<SearchMovies>(_onSearchMovies);
    on<RefreshMovies>(_onRefreshMovies);
  }

  Future<void> _onLoadPopularMovies(
    LoadPopularMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (state is! MoviesLoaded) {
        emit(MovieLoading());
      }

      final response = await _apiService.getPopularMovies(page: event.page);

      if (state is MoviesLoaded) {
        final currentState = state as MoviesLoaded;
        final updatedMovies = event.page == 1
            ? response.results
            : [...currentState.popularMovies, ...response.results];

        emit(currentState.copyWith(
          popularMovies: updatedMovies,
          isLoadingMore: false,
        ));
      } else {
        emit(MoviesLoaded(popularMovies: response.results));
      }
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onLoadTopRatedMovies(
    LoadTopRatedMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (state is! MoviesLoaded) {
        emit(MovieLoading());
      }

      final response = await _apiService.getTopRatedMovies(page: event.page);

      if (state is MoviesLoaded) {
        final currentState = state as MoviesLoaded;
        final updatedMovies = event.page == 1
            ? response.results
            : [...currentState.topRatedMovies, ...response.results];

        emit(currentState.copyWith(
          topRatedMovies: updatedMovies,
          isLoadingMore: false,
        ));
      } else {
        emit(MoviesLoaded(topRatedMovies: response.results));
      }
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onLoadNowPlayingMovies(
    LoadNowPlayingMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (state is! MoviesLoaded) {
        emit(MovieLoading());
      }

      final response = await _apiService.getNowPlayingMovies(page: event.page);

      if (state is MoviesLoaded) {
        final currentState = state as MoviesLoaded;
        final updatedMovies = event.page == 1
            ? response.results
            : [...currentState.nowPlayingMovies, ...response.results];

        emit(currentState.copyWith(
          nowPlayingMovies: updatedMovies,
          isLoadingMore: false,
        ));
      } else {
        emit(MoviesLoaded(nowPlayingMovies: response.results));
      }
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onLoadUpcomingMovies(
    LoadUpcomingMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (state is! MoviesLoaded) {
        emit(MovieLoading());
      }

      final response = await _apiService.getUpcomingMovies(page: event.page);

      if (state is MoviesLoaded) {
        final currentState = state as MoviesLoaded;
        final updatedMovies = event.page == 1
            ? response.results
            : [...currentState.upcomingMovies, ...response.results];

        emit(currentState.copyWith(
          upcomingMovies: updatedMovies,
          isLoadingMore: false,
        ));
      } else {
        emit(MoviesLoaded(upcomingMovies: response.results));
      }
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onSearchMovies(
    SearchMovies event,
    Emitter<MovieState> emit,
  ) async {
    try {
      if (event.page == 1) {
        emit(MovieLoading());
      }

      final response =
          await _apiService.searchMovies(event.query, page: event.page);

      if (state is MoviesLoaded && event.page > 1) {
        final currentState = state as MoviesLoaded;
        final updatedResults = [
          ...currentState.searchResults,
          ...response.results
        ];

        emit(currentState.copyWith(
          searchResults: updatedResults,
          isLoadingMore: false,
        ));
      } else {
        emit(MoviesLoaded(searchResults: response.results));
      }
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());

    try {
      // Load semua kategori film secara bersamaan
      final results = await Future.wait([
        _apiService.getPopularMovies(),
        _apiService.getTopRatedMovies(),
        _apiService.getNowPlayingMovies(),
        _apiService.getUpcomingMovies(),
      ]);

      emit(MoviesLoaded(
        popularMovies: results[0].results,
        topRatedMovies: results[1].results,
        nowPlayingMovies: results[2].results,
        upcomingMovies: results[3].results,
      ));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
