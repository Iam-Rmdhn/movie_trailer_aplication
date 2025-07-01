import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/feature/profile/data/model/profile_option_model.dart';

class ProfileItemDarkMode extends StatelessWidget {
  final ProfileOptionModel profileOptionModel;
  final VoidCallback onTap;
  const ProfileItemDarkMode({
    super.key,
    required this.onTap,
    required this.profileOptionModel,
  });

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
        minLeadingWidth: 20,
        contentPadding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(vertical: -2),
        title: Text(
          profileOptionModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
        ),
        trailing: Switch(
          activeColor: AppColors.white,
          inactiveThumbColor: Theme.of(context).primaryColor,
          activeTrackColor: Theme.of(context).primaryColor,
          value: AppDynamicColorBuilder.isDarkMode,
          onChanged: (value) {
            AppThemeCubit.instanse.changeTheme();
          },
        ),
      ),
    );
  }
}
