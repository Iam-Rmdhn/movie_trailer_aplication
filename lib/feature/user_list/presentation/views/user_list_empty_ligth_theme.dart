import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/core/utils/app_string.dart';

class UserListEmptyLigthTheme extends StatelessWidget {
  const UserListEmptyLigthTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Image(
            image: AssetImage(AppImageAssets.imagesEmptyListLight),
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppString.yourListEmpty,
          style: TextStyle(
            color: AppColors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          AppString.emptyListMessage,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
