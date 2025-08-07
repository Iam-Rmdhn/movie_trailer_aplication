import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/auth/services/auth_service.dart';
import 'package:movie_app/core/auth/bloc/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  StreamSubscription? _authStateSubscription;

  AuthBloc(this._authService) : super(AuthInitial()) {
    on<AuthInitialize>(_onInitialize);
    on<AuthLogin>(_onLogin);
    on<AuthRegister>(_onRegister);
    on<AuthLogout>(_onLogout);
    on<AuthResetPassword>(_onResetPassword);
    on<AuthUpdateProfile>(_onUpdateProfile);
    on<AuthChangePassword>(_onChangePassword);
  }

  Future<void> _onInitialize(
    AuthInitialize event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    // Check if user is already logged in
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      emit(AuthAuthenticated(currentUser));
    } else {
      emit(AuthUnauthenticated());
    }

    // Setup minimal stream listener only for logout detection
    _authStateSubscription?.cancel();
    _authStateSubscription = _authService.authStateChanges.listen(
      (user) {
        // Only handle logout event, not login to prevent conflicts
        if (user == null && state is AuthAuthenticated) {
          emit(AuthUnauthenticated());
        }
      },
    );
  }

  Future<void> _onLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final user = await _authService.signIn(
        email: event.credentials.email,
        password: event.credentials.password,
      );

      // Emit authenticated state immediately
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onRegister(
    AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final user = await _authService.signUp(
        email: event.credentials.email,
        password: event.credentials.password,
        displayName: event.credentials.displayName,
      );

      // Add a small delay before emitting authenticated state
      await Future.delayed(const Duration(milliseconds: 300));
      emit(AuthAuthenticated(user));
    } catch (e) {
      // Add a small delay before emitting error to prevent UI conflicts
      await Future.delayed(const Duration(milliseconds: 100));
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await _authService.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onResetPassword(
    AuthResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.resetPassword(email: event.email);
      emit(AuthPasswordResetSent(event.email));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onUpdateProfile(
    AuthUpdateProfile event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final user = await _authService.updateProfile(
        displayName: event.displayName,
        photoUrl: event.photoUrl,
      );

      emit(AuthProfileUpdated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onChangePassword(
    AuthChangePassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await _authService.changePassword(newPassword: event.newPassword);
      emit(AuthPasswordChanged());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _authStateSubscription?.cancel();
    return super.close();
  }
}
