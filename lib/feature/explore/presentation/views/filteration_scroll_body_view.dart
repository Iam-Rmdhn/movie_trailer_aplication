import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/feature/explore/presentation/views/button_action_view.dart';
import 'package:movie_app/feature/explore/presentation/widgets/filteration_header_widget.dart';

import '../widgets/filter_item_widget.dart';

class FilterationScrollBodyView extends StatelessWidget {
  final ScrollController scrollController;
  const FilterationScrollBodyView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: const [
        SliverToBoxAdapter(
          child: FilterationHeaderWidget(),
        ),
        SliverToBoxAdapter(
          child: FilterItemWidget(
            title: AppString.categories,
            choise: AppString.moviesCatgories,
          ),
        ),
        SliverToBoxAdapter(
          child: FilterItemWidget(
            title: AppString.regions,
            choise: AppString.regionsList,
          ),
        ),
        SliverToBoxAdapter(
          child: FilterItemWidget(
            title: AppString.genre,
            choise: AppString.genreList,
          ),
        ),
        SliverToBoxAdapter(
          child: FilterItemWidget(
            title: AppString.time,
            choise: AppString.timeAndPeriods,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              top: 25,
            ),
            child: ButtonActionView(),
          ),
        ),
      ],
    );
  }
}
