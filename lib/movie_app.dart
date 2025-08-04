import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/screens/splash_screen.dart';
import 'package:movie_app/core/theme/app_theme.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        final isLight = state is! DarkThemeState;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
          home: const SplashScreen(),
        );
      },
    );
  }
}
