import 'package:flutter/material.dart';
import 'package:movie_app/feature/download/data/model/download_movie_model.dart';
import 'package:movie_app/feature/download/presentation/widgets/download_movie_item.dart';

class DownloadMovieListView extends StatelessWidget {
  const DownloadMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: DownloadMovieModel.getDownloadMovie().length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: DownloadMovieItem(
            movieModel: DownloadMovieModel.getDownloadMovie()[index],
          ),
        );
      },
    );
  }
}
