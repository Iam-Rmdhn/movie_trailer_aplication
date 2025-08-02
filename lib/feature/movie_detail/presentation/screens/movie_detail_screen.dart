import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/data/services/movie_detail_service.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/feature/movie_detail/data/bloc/movie_detail_bloc.dart';
import 'package:movie_app/feature/movie_detail/data/bloc/movie_detail_event.dart';
import 'package:movie_app/feature/movie_detail/presentation/widgets/movie_detail_header.dart';
import 'package:movie_app/feature/movie_detail/presentation/widgets/movie_info_section.dart';
import 'package:movie_app/feature/movie_detail/presentation/widgets/cast_section.dart';
import 'package:movie_app/feature/movie_detail/presentation/widgets/video_section.dart';
import 'package:movie_app/feature/movie_detail/presentation/widgets/similar_movies_section.dart';

class MovieDetailScreen extends StatelessWidget {
  final TMDBMovie movie;

  const MovieDetailScreen({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailBloc(MovieDetailService())
        ..add(LoadMovieDetail(movieId: movie.id)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return _buildLoadingState(context);
            }

            if (state is MovieDetailError) {
              return _buildErrorState(context, state.message);
            }

            if (state is MovieDetailLoaded) {
              return _buildDetailContent(context, state);
            }

            return _buildInitialState();
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Stack(
      children: [
        // Background dengan gambar film
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: movie.backdropPath != null
                ? DecorationImage(
                    image: CachedNetworkImageProvider(
                      ApiConstants.getImageUrl(movie.backdropPath,
                          isOriginal: true),
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
            color: Colors.grey[800],
          ),
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
        ),
        // Loading indicator
        const Center(
          child: CircularProgressIndicator(),
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
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String message) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Error: $message',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<MovieDetailBloc>().add(
                      RefreshMovieDetail(movieId: movie.id),
                    );
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitialState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildDetailContent(BuildContext context, MovieDetailLoaded state) {
    return CustomScrollView(
      slivers: [
        // Header dengan backdrop dan poster
        SliverToBoxAdapter(
          child: MovieDetailHeader(
            movieDetail: state.movieDetail,
            movie: movie,
          ),
        ),

        // Informasi film
        SliverToBoxAdapter(
          child: MovieInfoSection(movieDetail: state.movieDetail),
        ),

        // Cast & Crew
        if (state.credits != null)
          SliverToBoxAdapter(
            child: CastSection(credits: state.credits!),
          )
        else if (state.isLoadingCredits)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),

        // Videos/Trailers
        if (state.videos != null && state.videos!.results.isNotEmpty)
          SliverToBoxAdapter(
            child: VideoSection(videos: state.videos!),
          )
        else if (state.isLoadingVideos)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),

        // Similar Movies
        if (state.similarMovies.isNotEmpty)
          SliverToBoxAdapter(
            child: SimilarMoviesSection(
              title: 'Film Serupa',
              movies: state.similarMovies,
            ),
          )
        else if (state.isLoadingSimilar)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),

        // Recommendations
        if (state.recommendations.isNotEmpty)
          SliverToBoxAdapter(
            child: SimilarMoviesSection(
              title: 'Rekomendasi',
              movies: state.recommendations,
            ),
          )
        else if (state.isLoadingRecommendations)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),

        // Bottom spacing
        const SliverToBoxAdapter(
          child: SizedBox(height: 32),
        ),
      ],
    );
  }
}
