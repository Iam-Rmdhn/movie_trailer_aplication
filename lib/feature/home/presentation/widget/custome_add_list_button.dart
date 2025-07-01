import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/utils/app_string.dart';

class CustomeAddListButton extends StatelessWidget {
  const CustomeAddListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.red.withOpacity(0),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white,
          width: 2.5,
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.add,
            color: Colors.white,
            size: 18,
          ),
          SizedBox(
            width: 11,
          ),
          Text(
            AppString.myList,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
