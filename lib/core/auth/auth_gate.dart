import 'package:flutter/material.dart';
import 'package:movie_app/feature/home/presentation/screens/main_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Langsung ke MainScreen tanpa autentikasi Firebase
    return const MainScreen();
  }
}
