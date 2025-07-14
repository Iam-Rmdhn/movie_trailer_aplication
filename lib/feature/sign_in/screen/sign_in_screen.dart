import 'package:flutter/material.dart';
import 'package:movie_app/core/auth/auth_service.dart';
import 'package:movie_app/core/component/my_button.dart';
import 'package:movie_app/core/component/textfield.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';

class SignInScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignInScreen({super.key, required this.onTap});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final authService = AuthService();

    try {
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImageAssets.imagesAppLogo, width: 20),
                  const SizedBox(height: 50),
                  const Text("Selamat Datang Kembali!",
                      style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    children: const [
                      Column(
                        children: [
                          Icon(Icons.email, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    children: const [
                      Column(
                        children: [
                          Icon(Icons.lock, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  MyButton(onTap: signIn, text: "Sign In"),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Belum punya akun?'),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Daftar sekarang',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
