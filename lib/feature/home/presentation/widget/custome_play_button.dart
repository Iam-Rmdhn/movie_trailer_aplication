import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/core/utils/app_string.dart';

class CustomePlayButton extends StatelessWidget {
  const CustomePlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppImageAssets.imagesIconPlay),
          const SizedBox(
            width: 9,
          ),
          const Text(
            AppString.play,
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
