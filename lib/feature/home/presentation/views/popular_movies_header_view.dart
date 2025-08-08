import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';
import 'package:movie_app/feature/movie_detail/presentation/screens/movie_detail_screen.dart';
import 'package:movie_app/feature/user_list/presentation/widgets/add_to_list_button.dart';
import 'package:movie_app/feature/home/presentation/widgets/play_button.dart';

class PopularMoviesHeaderView extends StatefulWidget {
  const PopularMoviesHeaderView({super.key});

  @override
  State<PopularMoviesHeaderView> createState() =>
      _PopularMoviesHeaderViewState();
}

class _PopularMoviesHeaderViewState extends State<PopularMoviesHeaderView> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  bool _isUserInteracting = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients && !_isUserInteracting) {
        _currentPage = (_currentPage + 1) % 10; // Maksimal 10 film
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _pauseAutoSlide() {
    setState(() {
      _isUserInteracting = true;
    });

    // Resume auto slide after 10 seconds of no interaction
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          _isUserInteracting = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.black87],
                ),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is MovieError) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black54, Colors.black87],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.white, size: 50),
                    const SizedBox(height: 16),
                    Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
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
            final popularMovies = state.popularMovies.take(10).toList();

            if (popularMovies.isEmpty) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black54, Colors.black87],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'No popular movies available',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }

            return Stack(
              children: [
                // Background dengan PageView
                GestureDetector(
                  onPanStart: (_) => _pauseAutoSlide(),
                  onTap: () {
                    _pauseAutoSlide();
                    // Navigate to movie detail
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(
                          movie: popularMovies[_currentPage],
                        ),
                      ),
                    );
                  },
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = popularMovies[index];
                      return _buildMovieBackground(movie);
                    },
                  ),
                ),

                // Logo aplikasi
                Positioned(
                  top: 40,
                  left: 20,
                  child: SvgPicture.asset(
                    AppImageAssets.imagesAppLogo,
                    height: 40,
                  ),
                ),

                // Informasi film di bagian bawah
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: _buildMovieInfo(popularMovies[_currentPage]),
                ),
              ],
            );
          }

          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.black87],
              ),
            ),
            child: const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMovieBackground(TMDBMovie movie) {
    return Stack(
      children: [
        // Background image
        Container(
          child: movie.backdropPath != null
              ? CachedNetworkImage(
                  imageUrl: ApiConstants.getImageUrl(movie.backdropPath,
                      isOriginal: true),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[800],
                    child: const Center(
                      child: Icon(Icons.movie, color: Colors.white, size: 100),
                    ),
                  ),
                )
              : Container(
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.movie, color: Colors.white, size: 100),
                  ),
                ),
        ),
        // Gradient overlay
        Container(
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
      ],
    );
  }

  Widget _buildMovieInfo(TMDBMovie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          movie.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                movie.voteAverage.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              movie.releaseDate.isNotEmpty
                  ? movie.releaseDate.substring(0, 4)
                  : 'N/A',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          movie.overview.isNotEmpty
              ? movie.overview
              : 'No description available for this movie.',
          style: TextStyle(
            color: movie.overview.isNotEmpty ? Colors.white70 : Colors.white54,
            fontSize: 14,
            height: 1.4,
            fontStyle:
                movie.overview.isNotEmpty ? FontStyle.normal : FontStyle.italic,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            PlayButton(
              movie: movie,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            const SizedBox(width: 12),
            MyListActionButton(movie: movie),
          ],
        ),
      ],
    );
  }
}
