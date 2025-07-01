import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/feature/explore/presentation/widgets/non_selected_filter_item.dart';
import 'package:movie_app/feature/explore/presentation/widgets/selected_filter_item.dart';

class FilterItemWidget extends StatefulWidget {
  final String title;
  final List<String> choise;
  const FilterItemWidget(
      {super.key, required this.title, required this.choise});

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  int selectedItem = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 25, start: 10, end: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppDynamicColorBuilder.getGrey800AndWhite(context),
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.choise.length,
              itemBuilder: (context, index) {
                return (index == selectedItem)
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: SelectedFilterItem(
                          title: widget.choise[index],
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                        child: NonSelectedFilterItem(
                          title: widget.choise[index],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
