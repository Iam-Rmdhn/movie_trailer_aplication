import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/auth/bloc/auth_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_event.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        String displayName = 'User';
        String email = 'user@example.com';
        String? avatarUrl;

        if (state is AuthAuthenticated) {
          displayName = state.user.displayName ?? 'User';
          email = state.user.email;
          avatarUrl = state.user.photoUrl;
        }

        return Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  foregroundImage: avatarUrl != null
                      ? NetworkImage(avatarUrl)
                      : const AssetImage(AppImageAssets.userProfile)
                          as ImageProvider,
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
              displayName,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppDynamicColorBuilder.getGrey900AndWhite(context),
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppDynamicColorBuilder.getGrey900AndWhite(context),
                  fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }
}
