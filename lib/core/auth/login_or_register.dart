import 'package:flutter/material.dart';
import 'package:movie_app/feature/sign_up/screen/sign_up_screen.dart';
import 'package:movie_app/feature/sign_in/screen/sign_in_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? SignInScreen(onTap: togglePages)
        : SignUpScreen(onTap: togglePages);
  }
}
