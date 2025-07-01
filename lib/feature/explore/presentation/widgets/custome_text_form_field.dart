import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/theme/controller/app_theme_cubit.dart';
import 'package:movie_app/core/utils/app_string.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return TextField(
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            hintText: AppString.search,
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
