import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';

class CustomeAppBar extends StatelessWidget {
  final String title;

  const CustomeAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: SvgPicture.asset(
          AppImageAssets.imagesAppLogo,
          height: 10,
          width: 10,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
