import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/network/api_constants.dart';

class CustomeMovieItem extends StatelessWidget {
  final TMDBMovie movie;
  const CustomeMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: movie.posterPath != null
                      ? CachedNetworkImage(
                          imageUrl: ApiConstants.getImageUrl(movie.posterPath),
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.error),
                          ),
                        )
                      : Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.movie, size: 50),
                        ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '${movie.voteAverage.toStringAsFixed(1)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
