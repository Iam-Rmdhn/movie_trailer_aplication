import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_event.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/widgets/custome_app_bar.dart';
import 'package:movie_app/feature/profile/data/model/profile_option_model.dart';
import 'package:movie_app/feature/profile/presentation/views/premium_card_view.dart';
import 'package:movie_app/feature/profile/presentation/views/user_profile_info.dart';
import 'package:movie_app/feature/profile/presentation/widgets/profile_item_dark_mode.dart';
import 'package:movie_app/feature/profile/presentation/widgets/profile_item_widget.dart';
import 'package:movie_app/feature/profile/presentation/widgets/logout_item_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Konfirmasi Logout',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          'Apakah Anda yakin ingin keluar dari aplikasi?',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Batal',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Tampilkan loading indicator
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 12),
                      Text('Melakukan logout...'),
                    ],
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
              context.read<AuthBloc>().add(AuthLogout());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          // Clear any existing snackbars
          ScaffoldMessenger.of(context).clearSnackBars();

          // Show logout success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Logout berhasil!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }

        if (state is AuthError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Padding(
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
                // Handle logout dengan styling khusus
                if (option.title == AppString.logout) {
                  return LogoutItemWidget(
                    profileOptionModel: option,
                    onTap: () => _showLogoutDialog(context),
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
          ],
        ),
      ),
    );
  }
}
