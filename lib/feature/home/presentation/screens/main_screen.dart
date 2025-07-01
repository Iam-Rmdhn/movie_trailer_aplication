import 'package:flutter/material.dart';
import 'package:movie_app/feature/download/presentation/screens/download_screen.dart';
import 'package:movie_app/feature/explore/presentation/screens/explore_screen.dart';
import 'package:movie_app/feature/home/presentation/screens/home_screen.dart';
import 'package:movie_app/feature/home/presentation/views/bottom_navigation_bar_view.dart';
import 'package:movie_app/feature/profile/presentation/screens/profile_screen.dart';
import 'package:movie_app/feature/user_list/presentation/screens/user_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController pageController;
  int currentScreen = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: const [
            HomeScreen(),
            ExploreScreen(),
            UserListScreen(),
            DownloadScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarView(
          currentScreen: currentScreen, onTap: onButtonNavigationTap),
    );
  }

  onPageChanged(int page) {
    setState(() {
      currentScreen = page;
    });
  }

  onButtonNavigationTap(int page) {
    setState(() {
      pageController.jumpToPage(page);
      currentScreen = page;
    });
  }
}
