import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/widgets/custome_app_bar.dart';
import 'package:movie_app/feature/user_list/presentation/views/user_list_empty_dark_theme.dart';
import 'package:movie_app/feature/user_list/presentation/views/user_list_empty_ligth_theme.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomeAppBar(
          title: AppString.myList,
        ),
      ),
      body: Center(
        child: BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, state) {
            if (state is LightThemeState) {
              return const UserListEmptyLigthTheme();
            }
            return const UserListEmptyDarkTheme();
          },
        ),
      ),
    );
  }
}
