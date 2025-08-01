import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';

enum MovieType {
  popular,
  topRated,
  nowPlaying,
  upcoming,
}

class ApiMovieListView extends StatelessWidget {
  final MovieType movieType;

  const ApiMovieListView({
    super.key,
    required this.movieType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const SizedBox(
            height: 250,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is MovieError) {
          return SizedBox(
            height: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 50, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MovieBloc>().add(RefreshMovies());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is MoviesLoaded) {
          List<TMDBMovie> movies = _getMoviesByType(state);

          if (movies.isEmpty) {
            return const SizedBox(
              height: 250,
              child: Center(
                child: Text('No movies available'),
              ),
            );
          }

          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return CustomeMovieItem(
                  movie: movies[index],
                );
              },
            ),
          );
        }

        return const SizedBox(
          height: 250,
          child: Center(
            child: Text('No data'),
          ),
        );
      },
    );
  }

  List<TMDBMovie> _getMoviesByType(MoviesLoaded state) {
    switch (movieType) {
      case MovieType.popular:
        return state.popularMovies;
      case MovieType.topRated:
        return state.topRatedMovies;
      case MovieType.nowPlaying:
        return state.nowPlayingMovies;
      case MovieType.upcoming:
        return state.upcomingMovies;
    }
  }
}
