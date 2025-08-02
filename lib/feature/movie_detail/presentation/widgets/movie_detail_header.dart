import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/data/models/movie_detail.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/network/api_constants.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetail movieDetail;
  final TMDBMovie movie;

  const MovieDetailHeader({
    super.key,
    required this.movieDetail,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          // Backdrop image
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: movieDetail.backdropPath != null
                  ? DecorationImage(
                      image: CachedNetworkImageProvider(
                        ApiConstants.getImageUrl(movieDetail.backdropPath,
                            isOriginal: true),
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey[800],
            ),
          ),

          // Gradient overlay
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Back button
          Positioned(
            top: 40,
            left: 16,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Share button
          Positioned(
            top: 40,
            right: 16,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  // TODO: Implement share functionality
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Poster and basic info
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Poster
                Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: movieDetail.posterPath != null
                        ? CachedNetworkImage(
                            imageUrl: ApiConstants.getImageUrl(
                                movieDetail.posterPath),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Colors.grey[800],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[800],
                              child: const Icon(Icons.movie,
                                  color: Colors.white, size: 50),
                            ),
                          )
                        : Container(
                            color: Colors.grey[800],
                            child: const Icon(Icons.movie,
                                color: Colors.white, size: 50),
                          ),
                  ),
                ),

                const SizedBox(width: 16),

                // Title and basic info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          movieDetail.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        if (movieDetail.tagline != null &&
                            movieDetail.tagline!.isNotEmpty)
                          Text(
                            movieDetail.tagline!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${movieDetail.voteAverage.toStringAsFixed(1)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              movieDetail.releaseDate.isNotEmpty
                                  ? movieDetail.releaseDate.substring(0, 4)
                                  : 'N/A',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            if (movieDetail.runtime > 0) ...[
                              const SizedBox(width: 8),
                              Text(
                                '${movieDetail.runtime} min',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // TODO: Implement play functionality
                                },
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('Play'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: () {
                                // TODO: Implement add to watchlist
                              },
                              icon: const Icon(Icons.add, color: Colors.white),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
