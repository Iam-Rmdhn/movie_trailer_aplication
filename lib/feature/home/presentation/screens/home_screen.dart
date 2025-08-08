import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';
import 'package:movie_app/feature/home/presentation/views/popular_movies_header_view.dart';
import 'package:movie_app/feature/home/presentation/views/api_movie_list_view.dart';
import 'package:movie_app/feature/home/presentation/widget/custome_row_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load data saat screen pertama kali dibuka
    context.read<MovieBloc>().add(RefreshMovies());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<MovieBloc>().add(RefreshMovies());
      },
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PopularMoviesHeaderView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomeRowText(title: AppString.topMoviesThisweek),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ApiMovieListView(
                movieType: MovieType.topRated,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomeRowText(title: AppString.newReleases),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ApiMovieListView(
                movieType: MovieType.nowPlaying,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomeRowText(title: AppString.upcoming),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ApiMovieListView(
                movieType: MovieType.upcoming,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
