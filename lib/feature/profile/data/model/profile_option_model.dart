import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/core/utils/app_string.dart';

class ProfileOptionModel {
  final String title;
  final String imagePath;

  ProfileOptionModel({required this.imagePath, required this.title});

  static List<ProfileOptionModel> getAllProfileOptions() {
    return [
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconProfile,
        title: AppString.editProfile,
      ),
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconBell,
        title: AppString.notification,
      ),
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconDownload,
        title: AppString.download,
      ),
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconLanguage,
        title: AppString.language,
      ),
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconSecurity,
        title: AppString.security,
      ),
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconEye,
        title: AppString.darkMode,
      ),
      ProfileOptionModel(
        imagePath: AppImageAssets.imagesIconHelp,
        title: AppString.helpCenter,
      ),
    ];
  }
}
