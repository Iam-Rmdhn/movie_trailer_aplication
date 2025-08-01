import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';

class TopMovieListView extends StatelessWidget {
  const TopMovieListView({super.key});

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
                      context.read<MovieBloc>().add(LoadTopRatedMovies());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is MoviesLoaded) {
          final topRatedMovies = state.topRatedMovies;

          if (topRatedMovies.isEmpty) {
            return const SizedBox(
              height: 250,
              child: Center(
                child: Text('No top movies available'),
              ),
            );
          }

          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRatedMovies.length,
              itemBuilder: (context, index) {
                return CustomeMovieItem(
                  movie: topRatedMovies[index],
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
}
