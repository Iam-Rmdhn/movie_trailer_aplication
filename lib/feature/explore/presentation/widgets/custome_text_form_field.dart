import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/feature/home/data/bloc/movie_event.dart';

class CustomeTextFormField extends StatefulWidget {
  const CustomeTextFormField({super.key});

  @override
  State<CustomeTextFormField> createState() => _CustomeTextFormFieldState();
}

class _CustomeTextFormFieldState extends State<CustomeTextFormField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.trim().isNotEmpty) {
      // Debounce search to avoid too many API calls
      Future.delayed(const Duration(milliseconds: 500), () {
        if (_controller.text == query && mounted) {
          context.read<MovieBloc>().add(SearchMovies(query: query.trim()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return TextField(
          controller: _controller,
          cursorColor: AppColors.black,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: AppString.search,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      // Clear search results
                      context.read<MovieBloc>().add(RefreshMovies());
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppDynamicColorBuilder.getGrey100AndDark2(context),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppDynamicColorBuilder.getGrey100AndDark2(context),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppDynamicColorBuilder.getGrey100AndDark2(context),
              ),
            ),
            fillColor: AppDynamicColorBuilder.getGrey100AndDark2(context),
            filled: true,
          ),
        );
      },
    );
  }
}
