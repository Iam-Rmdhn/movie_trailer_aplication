import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';

import '../../data/model/profile_option_model.dart';

class ProfileItemWidget extends StatelessWidget {
  final ProfileOptionModel profileOptionModel;
  final VoidCallback onTap;
  const ProfileItemWidget(
      {super.key, required this.profileOptionModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          profileOptionModel.imagePath,
          colorFilter: ColorFilter.mode(
            AppDynamicColorBuilder.getGrey900AndWhite(context),
            BlendMode.srcIn,
          ),
        ),
        title: Text(
          profileOptionModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
        minLeadingWidth: 20,
        contentPadding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(vertical: -2),
        trailing: SvgPicture.asset(
          AppImageAssets.imagesIconArrowRight,
          colorFilter: ColorFilter.mode(
            AppDynamicColorBuilder.getGrey900AndWhite(context),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
