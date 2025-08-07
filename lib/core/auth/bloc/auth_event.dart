import 'package:equatable/equatable.dart';
import 'package:movie_app/core/auth/models/auth_models.dart';

// Auth Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthInitialize extends AuthEvent {}

class AuthLogin extends AuthEvent {
  final AuthCredentials credentials;

  const AuthLogin(this.credentials);

  @override
  List<Object> get props => [credentials];
}

class AuthRegister extends AuthEvent {
  final RegisterCredentials credentials;

  const AuthRegister(this.credentials);

  @override
  List<Object> get props => [credentials];
}

class AuthLogout extends AuthEvent {}

class AuthResetPassword extends AuthEvent {
  final String email;

  const AuthResetPassword(this.email);

  @override
  List<Object> get props => [email];
}

class AuthUpdateProfile extends AuthEvent {
  final String? displayName;
  final String? photoUrl;

  const AuthUpdateProfile({this.displayName, this.photoUrl});

  @override
  List<Object?> get props => [displayName, photoUrl];
}

class AuthChangePassword extends AuthEvent {
  final String newPassword;

  const AuthChangePassword(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

// Auth States
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthUser user;

  const AuthAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

class AuthPasswordResetSent extends AuthState {
  final String email;

  const AuthPasswordResetSent(this.email);

  @override
  List<Object> get props => [email];
}

class AuthProfileUpdated extends AuthState {
  final AuthUser user;

  const AuthProfileUpdated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthPasswordChanged extends AuthState {}
