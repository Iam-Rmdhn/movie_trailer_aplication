import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/data/models/movie_detail.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/data/services/movie_detail_service.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/feature/movie_detail/presentation/screens/simple_trailer_screen.dart';
import 'package:movie_app/feature/user_list/presentation/widgets/add_to_list_button.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetail movieDetail;
  final TMDBMovie movie;

  const MovieDetailHeader({
    super.key,
    required this.movieDetail,
    required this.movie,
  });

  Future<void> _handlePlay(BuildContext context) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Try to get movie videos/trailers
      final movieDetailService = MovieDetailService();
      final videos = await movieDetailService.getMovieVideos(movie.id);

      // Check if context is still mounted
      if (!context.mounted) return;

      // Hide loading dialog
      Navigator.of(context).pop();

      final trailers = videos.results
          .where((video) =>
              video.type.toLowerCase() == 'trailer' &&
              video.site.toLowerCase() == 'youtube')
          .toList();

      if (trailers.isNotEmpty) {
        // If trailer is available, show trailer screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SimpleTrailerScreen(
              video: trailers.first,
              movieTitle: movie.title,
            ),
          ),
        );
      } else {
        // If no trailer available, show snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trailer tidak tersedia untuk film ini'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Check if context is still mounted
      if (!context.mounted) return;

      // Hide loading dialog
      Navigator.of(context).pop();

      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading trailer: ${e.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

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
                                onPressed: () => _handlePlay(context),
                                icon: const Icon(Icons.play_arrow),
                                label: const Text('Play'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white.withOpacity(0.2)
                                    : Colors.black.withOpacity(0.1),
                                border: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Border.all(
                                        color: Colors.black.withOpacity(0.2),
                                        width: 1)
                                    : null,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AddToListButton(
                                  movie: movie,
                                  iconSize: 24,
                                  iconColor: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black87,
                                  addedIconColor: Colors.green,
                                ),
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
