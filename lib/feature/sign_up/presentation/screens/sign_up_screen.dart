import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_event.dart';
import 'package:movie_app/core/auth/models/auth_models.dart';
import 'package:movie_app/core/auth/widgets/auth_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      final credentials = RegisterCredentials(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        displayName: _nameController.text.trim().isEmpty
            ? null
            : _nameController.text.trim(),
      );

      context.read<AuthBloc>().add(AuthRegister(credentials));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthAuthenticated) {
          // Clear any existing snackbars
          ScaffoldMessenger.of(context).clearSnackBars();

          // Show success message briefly
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registrasi berhasil! Selamat datang!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );

          // Navigate back to main app with delay to prevent rate limiting issues
          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          });
        }
      },
      child: AuthScaffold(
        title: 'Daftar',
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buat akun baru untuk menikmati film favorit Anda!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),

              // Name Field (Optional)
              CustomTextField(
                label: 'Nama Lengkap (Opsional)',
                hintText: 'Masukkan nama lengkap Anda',
                controller: _nameController,
                prefixIcon:
                    const Icon(Icons.person_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Email Field
              CustomTextField(
                label: 'Email',
                hintText: 'Masukkan email Anda',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password Field
              CustomTextField(
                label: 'Password',
                hintText: 'Masukkan password Anda',
                controller: _passwordController,
                isPassword: true,
                prefixIcon: const Icon(Icons.lock_outlined, color: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Confirm Password Field
              CustomTextField(
                label: 'Konfirmasi Password',
                hintText: 'Masukkan ulang password Anda',
                controller: _confirmPasswordController,
                isPassword: true,
                prefixIcon: const Icon(Icons.lock_outlined, color: Colors.grey),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Konfirmasi password tidak boleh kosong';
                  }
                  if (value != _passwordController.text) {
                    return 'Password tidak sama';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Sign Up Button
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return CustomButton(
                    text: 'Daftar',
                    isLoading: state is AuthLoading,
                    onPressed: _signUp,
                  );
                },
              ),
              const SizedBox(height: 24),

              // Sign In Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Terms and Conditions
              const Text(
                'Dengan mendaftar, Anda menyetujui Syarat & Ketentuan dan Kebijakan Privasi kami.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
