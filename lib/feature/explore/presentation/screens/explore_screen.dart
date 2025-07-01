import 'package:flutter/material.dart';
import 'package:movie_app/feature/explore/presentation/views/search_resulte_grid_view.dart';
import 'package:movie_app/feature/explore/presentation/views/selected_filteration_items_view.dart';

import '../views/search_bar_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchBarView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: SelectedFilterationItemsView(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SearchResulteGridView(),
        ],
      ),
    );
  }
}
