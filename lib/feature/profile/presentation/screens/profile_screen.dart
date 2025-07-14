import 'package:flutter/material.dart';
import 'package:movie_app/core/auth/auth_service.dart';
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

  void _signOut() {
    final authService = AuthService();
    authService.signOut();
  }

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
          SliverList.builder(
            itemCount: ProfileOptionModel.getAllProfileOptions().length,
            itemBuilder: (context, index) {
              final option = ProfileOptionModel.getAllProfileOptions()[index];
              // Menangani item Dark Mode secara khusus karena memiliki Switch
              if (option.title == AppString.darkMode) {
                return ProfileItemDarkMode(
                  profileOptionModel: option,
                  onTap: () {
                    AppThemeCubit.instanse.changeTheme();
                  },
                );
              }
              // Item profil standar
              return ProfileItemWidget(
                profileOptionModel: option,
                onTap: () {
                  // TODO: Tambahkan logika navigasi untuk setiap item di sini jika perlu
                },
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(AppString.signOut),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
