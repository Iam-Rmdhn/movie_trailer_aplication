import 'package:flutter/material.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/data/services/movie_detail_service.dart';
import 'package:movie_app/feature/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/feature/movie_detail/presentation/screens/simple_trailer_screen.dart';

class PlayButton extends StatelessWidget {
  final TMDBMovie movie;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const PlayButton({
    super.key,
    required this.movie,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handlePlay(context),
      icon: const Icon(Icons.play_arrow),
      label: const Text('Play'),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
        foregroundColor: foregroundColor ?? Colors.black,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }

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

      // Close loading dialog
      if (context.mounted) {
        Navigator.of(context).pop();
      }

      // Check if there are any trailers available
      final trailers = videos.results
          .where((video) =>
              video.type.toLowerCase().contains('trailer') &&
              video.site.toLowerCase() == 'youtube')
          .toList();

      if (context.mounted) {
        if (trailers.isNotEmpty) {
          // If trailer is available, show trailer options
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SimpleTrailerScreen(
                video: trailers.first,
                movieTitle: movie.title,
              ),
            ),
          );
        } else {
          // If no trailer available, go to movie detail screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movie: movie),
            ),
          );

          // Show snackbar to inform user
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No trailer available, showing movie details'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      // Close loading dialog if still open
      if (context.mounted) {
        Navigator.of(context).pop();

        // If error getting videos, fallback to movie detail screen
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(movie: movie),
          ),
        );

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unable to load trailer: ${e.toString()}'),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
