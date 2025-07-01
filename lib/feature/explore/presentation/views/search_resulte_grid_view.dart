import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';

class SearchResulteGridView extends StatelessWidget {
  const SearchResulteGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: MovieModel.getAllTopMovie().length,
        (context, index) {
          return CustomeMovieItem(model: MovieModel.getAllTopMovie()[index]);
        },
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 2.6,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          crossAxisCount: 2),
    );
  }
}
