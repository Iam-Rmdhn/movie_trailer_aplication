import 'package:flutter/material.dart';

import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/widgets/custome_app_bar.dart';
import 'package:movie_app/feature/download/presentation/views/download_movie_listv_iew.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomeAppBar(
              title: AppString.download,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(),
          ),
          DownloadMovieListView(),
        ],
      ),
    );
  }
}
