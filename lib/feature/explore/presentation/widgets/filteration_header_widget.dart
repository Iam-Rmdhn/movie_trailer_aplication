import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/utils/app_string.dart';

class FilterationHeaderWidget extends StatelessWidget {
  const FilterationHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Text(
          AppString.sortandFilter,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppColors.error,
              ),
        ),
      ],
    );
  }
}
