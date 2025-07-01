import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/feature/explore/presentation/widgets/selected_filter_item.dart';

class SelectedFilterationItemsView extends StatelessWidget {
  const SelectedFilterationItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SelectedFilterItem(title: AppString.moviesCatgories[0]),
          SelectedFilterItem(title: AppString.regionsList[0]),
          SelectedFilterItem(title: AppString.genreList[0]),
          SelectedFilterItem(title: AppString.timeAndPeriods[0]),
        ],
      ),
    );
  }
}
