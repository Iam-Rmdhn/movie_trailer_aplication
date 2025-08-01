import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';

class SearchResulteGridView extends StatelessWidget {
  const SearchResulteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (state is MovieError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.error, size: 50, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is MoviesLoaded) {
          final searchResults = state.searchResults;

          if (searchResults.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('Tidak ada hasil pencarian'),
                ),
              ),
            );
          }

          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: searchResults.length,
              (context, index) {
                return CustomeMovieItem(movie: searchResults[index]);
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 2.6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 2,
            ),
          );
        }

        // Default state - show popular movies
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 0,
            (context, index) {
              return Container();
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2 / 2.6,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
          ),
        );
      },
    );
  }
}
