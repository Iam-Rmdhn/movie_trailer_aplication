import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';
import 'package:movie_app/feature/home/presentation/views/home_movie_header_view.dart';
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
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeMovieHeaderView(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomeRowText(title: AppString.topMoviesThisweek),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ApiMovieListView(
                movieType: MovieType.topRated,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomeRowText(title: AppString.newReleases),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ApiMovieListView(
                movieType: MovieType.nowPlaying,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CustomeRowText(title: "Film Popular"),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ApiMovieListView(
                movieType: MovieType.popular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
