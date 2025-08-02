import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/data/services/movie_detail_service.dart';
import 'package:movie_app/feature/movie_detail/data/bloc/movie_detail_event.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieDetailService _detailService;

  MovieDetailBloc(this._detailService) : super(MovieDetailInitial()) {
    on<LoadMovieDetail>(_onLoadMovieDetail);
    on<LoadMovieCredits>(_onLoadMovieCredits);
    on<LoadMovieVideos>(_onLoadMovieVideos);
    on<LoadSimilarMovies>(_onLoadSimilarMovies);
    on<LoadRecommendations>(_onLoadRecommendations);
    on<RefreshMovieDetail>(_onRefreshMovieDetail);
  }

  Future<void> _onLoadMovieDetail(
    LoadMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    try {
      emit(MovieDetailLoading());

      final movieDetail = await _detailService.getMovieDetail(event.movieId);

      emit(MovieDetailLoaded(
        movieDetail: movieDetail,
        isLoadingCredits: true,
        isLoadingVideos: true,
        isLoadingSimilar: true,
        isLoadingRecommendations: true,
      ));

      // Load additional data
      add(LoadMovieCredits(movieId: event.movieId));
      add(LoadMovieVideos(movieId: event.movieId));
      add(LoadSimilarMovies(movieId: event.movieId));
      add(LoadRecommendations(movieId: event.movieId));
    } catch (e) {
      emit(MovieDetailError(e.toString()));
    }
  }

  Future<void> _onLoadMovieCredits(
    LoadMovieCredits event,
    Emitter<MovieDetailState> emit,
  ) async {
    if (state is MovieDetailLoaded) {
      try {
        final currentState = state as MovieDetailLoaded;

        final credits = await _detailService.getMovieCredits(event.movieId);

        emit(currentState.copyWith(
          credits: credits,
          isLoadingCredits: false,
        ));
      } catch (e) {
        final currentState = state as MovieDetailLoaded;
        emit(currentState.copyWith(
          isLoadingCredits: false,
          creditsError: e.toString(),
        ));
      }
    }
  }

  Future<void> _onLoadMovieVideos(
    LoadMovieVideos event,
    Emitter<MovieDetailState> emit,
  ) async {
    if (state is MovieDetailLoaded) {
      try {
        final currentState = state as MovieDetailLoaded;

        final videos = await _detailService.getMovieVideos(event.movieId);

        emit(currentState.copyWith(
          videos: videos,
          isLoadingVideos: false,
        ));
      } catch (e) {
        final currentState = state as MovieDetailLoaded;
        emit(currentState.copyWith(
          isLoadingVideos: false,
          videosError: e.toString(),
        ));
      }
    }
  }

  Future<void> _onLoadSimilarMovies(
    LoadSimilarMovies event,
    Emitter<MovieDetailState> emit,
  ) async {
    if (state is MovieDetailLoaded) {
      try {
        final currentState = state as MovieDetailLoaded;

        final response = await _detailService.getSimilarMovies(
          event.movieId,
          page: event.page,
        );

        emit(currentState.copyWith(
          similarMovies: response.results,
          isLoadingSimilar: false,
        ));
      } catch (e) {
        final currentState = state as MovieDetailLoaded;
        emit(currentState.copyWith(
          isLoadingSimilar: false,
          similarError: e.toString(),
        ));
      }
    }
  }

  Future<void> _onLoadRecommendations(
    LoadRecommendations event,
    Emitter<MovieDetailState> emit,
  ) async {
    if (state is MovieDetailLoaded) {
      try {
        final currentState = state as MovieDetailLoaded;

        final response = await _detailService.getMovieRecommendations(
          event.movieId,
          page: event.page,
        );

        emit(currentState.copyWith(
          recommendations: response.results,
          isLoadingRecommendations: false,
        ));
      } catch (e) {
        final currentState = state as MovieDetailLoaded;
        emit(currentState.copyWith(
          isLoadingRecommendations: false,
          recommendationsError: e.toString(),
        ));
      }
    }
  }

  Future<void> _onRefreshMovieDetail(
    RefreshMovieDetail event,
    Emitter<MovieDetailState> emit,
  ) async {
    // Refresh all data
    add(LoadMovieDetail(movieId: event.movieId));
  }
}
