import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/core/utils/app_string.dart';

class BottomNavigationBarView extends StatelessWidget {
  final int currentScreen;
  final void Function(int) onTap;
  BottomNavigationBarView(
      {super.key, required this.currentScreen, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentScreen,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          label: AppString.home,
          activeIcon: SvgPicture.asset(AppImageAssets.imagesIconHomeSelected),
          icon: SvgPicture.asset(AppImageAssets.imagesIconHome),
        ),
        BottomNavigationBarItem(
          label: AppString.explore,
          activeIcon:
              SvgPicture.asset(AppImageAssets.imagesIconExploreSelected),
          icon: SvgPicture.asset(AppImageAssets.imagesIconExplore),
        ),
        BottomNavigationBarItem(
          label: AppString.myList,
          activeIcon: SvgPicture.asset(AppImageAssets.imagesIconMyListSelected),
          icon: SvgPicture.asset(AppImageAssets.imagesIconMyList),
        ),
        BottomNavigationBarItem(
          label: AppString.download,
          activeIcon:
              SvgPicture.asset(AppImageAssets.imagesIconDownloadSelected),
          icon: SvgPicture.asset(AppImageAssets.imagesIconDownload),
        ),
        BottomNavigationBarItem(
          label: AppString.profile,
          activeIcon:
              SvgPicture.asset(AppImageAssets.imagesIconProfileSelected),
          icon: SvgPicture.asset(AppImageAssets.imagesIconProfile),
        ),
      ],
    );
  }
}
