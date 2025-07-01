import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';

class TopMovieListView extends StatelessWidget {
  const TopMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: MovieModel.getAllTopMovie().length,
        itemBuilder: (context, index) {
          return CustomeMovieItem(
            model: MovieModel.getAllTopMovie()[index],
          );
        },
      ),
    );
  }
}
