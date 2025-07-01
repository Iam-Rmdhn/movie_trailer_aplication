import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/feature/home/presentation/widget/custome_movie_description.dart';

class HomeMovieHeaderView extends StatelessWidget {
  const HomeMovieHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.44,
      child: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage(
                AppImageAssets.imagesHomeHeader,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: SvgPicture.asset(AppImageAssets.imagesAppLogo),
          ),
          const Positioned(
            bottom: 18,
            left: 20,
            child: CustomeMovieDescription(),
          ),
        ],
      ),
    );
  }
}
