import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/data/services/movie_api_service.dart';
import 'package:movie_app/core/helper/storage_helper.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/feature/home/data/bloc/movie_bloc.dart';
import 'package:movie_app/movie_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await StorageHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: AppThemeCubit.instanse..checkTheme(),
        ),
        BlocProvider(
          create: (context) => MovieBloc(MovieApiService()),
        ),
      ],
      child: const MovieApp(),
    ),
  );
}
