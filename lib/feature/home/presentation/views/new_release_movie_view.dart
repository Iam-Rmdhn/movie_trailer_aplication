import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/data/model/movie_model.dart';
import 'package:movie_app/feature/home/presentation/widget/cutome_movie_item.dart';

class NewReleaseMovieView extends StatelessWidget {
  const NewReleaseMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: MovieModel.getAllNewReleasesMovie().length,
        itemBuilder: (context, index) {
          return CustomeMovieItem(
            model: MovieModel.getAllNewReleasesMovie()[index],
          );
        },
      ),
    );
  }
}
