import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/core/utils/app_string.dart';

class UserListEmptyLigthTheme extends StatelessWidget {
  const UserListEmptyLigthTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: Image(
              image: AssetImage(AppImageAssets.imagesEmptyListLight),
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 24),
          Text(
            AppString.yourListEmpty,
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12),
          Text(
            AppString.emptyListMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
