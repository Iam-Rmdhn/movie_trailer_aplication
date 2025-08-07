import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_bloc.dart';
import 'package:movie_app/core/auth/bloc/auth_event.dart';
import 'package:movie_app/feature/sign_in/presentation/screens/sign_in_screen.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;
  final Widget? loadingWidget;

  const AuthGuard({
    super.key,
    required this.child,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          // Initialize auth state
          context.read<AuthBloc>().add(AuthInitialize());
          return _buildLoading();
        }

        if (state is AuthLoading) {
          return loadingWidget ?? _buildLoading();
        }

        if (state is AuthAuthenticated) {
          return child;
        }

        // AuthUnauthenticated or AuthError
        return const SignInScreen();
      },
    );
  }

  Widget _buildLoading() {
    return const Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              'Memuat...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
