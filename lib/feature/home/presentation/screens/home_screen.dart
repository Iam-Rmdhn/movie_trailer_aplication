import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/feature/home/presentation/views/home_movie_header_view.dart';
import 'package:movie_app/feature/home/presentation/views/new_release_movie_view.dart';
import 'package:movie_app/feature/home/presentation/views/top_movie_list_view.dart';
import 'package:movie_app/feature/home/presentation/widget/custome_row_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeMovieHeaderView(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CustomeRowText(title: AppString.topMoviesThisweek),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TopMovieListView(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CustomeRowText(title: AppString.newReleases),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: NewReleaseMovieView(),
          ),
        ),
      ],
    );
  }
}
