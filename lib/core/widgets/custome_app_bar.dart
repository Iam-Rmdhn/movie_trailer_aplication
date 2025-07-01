import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
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
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
        ),
      ),
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
