import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/widgets/custome_app_bar.dart';
import 'package:movie_app/feature/profile/data/model/profile_option_model.dart';
import 'package:movie_app/feature/profile/presentation/views/premium_card_view.dart';
import 'package:movie_app/feature/profile/presentation/views/user_profile_info.dart';
import 'package:movie_app/feature/profile/presentation/widgets/profile_item_dark_mode.dart';
import 'package:movie_app/feature/profile/presentation/widgets/profile_item_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CustomeAppBar(
              title: AppString.profile,
            ),
          ),
          const SliverToBoxAdapter(
            child: UserProfileInfo(),
          ),
          const SliverToBoxAdapter(
            child: PremiumCardView(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileItemWidget(
              profileOptionModel: ProfileOptionModel.getAllProfileOptions()[0],
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileItemWidget(
              profileOptionModel: ProfileOptionModel.getAllProfileOptions()[1],
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileItemWidget(
              profileOptionModel: ProfileOptionModel.getAllProfileOptions()[2],
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileItemWidget(
              profileOptionModel: ProfileOptionModel.getAllProfileOptions()[3],
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileItemWidget(
              profileOptionModel: ProfileOptionModel.getAllProfileOptions()[4],
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: ProfileItemDarkMode(
              profileOptionModel: ProfileOptionModel.getAllProfileOptions()[5],
              onTap: () {
                AppThemeCubit.instanse.changeTheme();
              },
            ),
          ),
        ],
      ),
    );
  }
}
