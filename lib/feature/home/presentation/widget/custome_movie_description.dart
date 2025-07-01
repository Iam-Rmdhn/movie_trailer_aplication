import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/feature/home/presentation/widget/custome_add_list_button.dart';
import 'package:movie_app/feature/home/presentation/widget/custome_play_button.dart';

class CustomeMovieDescription extends StatelessWidget {
  const CustomeMovieDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dr. Strange 2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Action, superHero, Sciense Fiction, ...',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CustomePlayButton(),
            SizedBox(
              width: 12,
            ),
            CustomeAddListButton(),
          ],
        )
      ],
    );
  }
}
