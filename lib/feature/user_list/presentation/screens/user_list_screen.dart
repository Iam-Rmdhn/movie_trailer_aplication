import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/core/widgets/custome_app_bar.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_bloc.dart';
import 'package:movie_app/feature/user_list/data/bloc/user_list_event.dart';
import 'package:movie_app/feature/user_list/presentation/views/user_list_empty_dark_theme.dart';
import 'package:movie_app/feature/user_list/presentation/views/user_list_empty_ligth_theme.dart';
import 'package:movie_app/feature/user_list/presentation/widgets/user_list_movie_item.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserListBloc>().add(LoadUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: CustomeAppBar(
          title: AppString.myList,
        ),
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<UserListBloc>().add(LoadUserList());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is UserListLoaded) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.movies.isEmpty
                  ? _buildEmptyState()
                  : _buildMovieList(state),
            );
          }

          return _buildEmptyState();
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      key: const ValueKey('empty_state'),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, themeState) {
          if (themeState is LightThemeState) {
            return const UserListEmptyLigthTheme();
          }
          return const UserListEmptyDarkTheme();
        },
      ),
    );
  }

  Widget _buildMovieList(UserListLoaded state) {
    return RefreshIndicator(
      key: const ValueKey('movie_list'),
      onRefresh: () async {
        context.read<UserListBloc>().add(LoadUserList());
      },
      child: ListView.builder(
        itemCount: state.movies.length,
        itemBuilder: (context, index) {
          return UserListMovieItem(
            movie: state.movies[index],
          );
        },
      ),
    );
  }
}
