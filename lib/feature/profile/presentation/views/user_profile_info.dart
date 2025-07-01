import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            const CircleAvatar(
              foregroundImage: AssetImage(AppImageAssets.userProfile),
              radius: 60,
            ),
            Positioned(
              child: SvgPicture.asset(AppImageAssets.imagesIconEditProfile),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Ilham Ramadhan',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'ilhamztr016@gmail.com',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppDynamicColorBuilder.getGrey900AndWhite(context),
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
