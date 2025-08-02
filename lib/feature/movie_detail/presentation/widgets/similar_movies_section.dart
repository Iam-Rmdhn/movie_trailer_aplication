import 'package:flutter/material.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';
import 'package:movie_app/feature/movie_detail/presentation/screens/movie_detail_screen.dart';

class SimilarMoviesSection extends StatelessWidget {
  final String title;
  final List<TMDBMovie> movies;

  const SimilarMoviesSection({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(movie: movie),
                    ),
                  );
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 12),
                  child: CustomeMovieItem(movie: movie),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
