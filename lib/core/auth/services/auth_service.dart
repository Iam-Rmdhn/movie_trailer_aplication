import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:movie_app/core/auth/models/auth_models.dart' as my_auth;

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final SupabaseClient _supabase = Supabase.instance.client;

  // Get current user
  my_auth.AuthUser? get currentUser {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      return my_auth.AuthUser.fromJson(user.toJson());
    }
    return null;
  }

  // Check if user is logged in
  bool get isLoggedIn => _supabase.auth.currentUser != null;

  // Auth state stream
  Stream<my_auth.AuthUser?> get authStateChanges {
    return _supabase.auth.onAuthStateChange.map((data) {
      final user = data.session?.user;
      if (user != null) {
        return my_auth.AuthUser.fromJson(user.toJson());
      }
      return null;
    });
  }

  // Sign up with email and password
  Future<my_auth.AuthUser> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      // Add a small delay to prevent rate limiting
      await Future.delayed(const Duration(milliseconds: 500));

      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: displayName != null ? {'display_name': displayName} : null,
      );

      if (response.user == null) {
        throw Exception('Registrasi gagal. Silakan coba lagi.');
      }

      // If session exists, user is automatically signed in (no email confirmation required)
      if (response.session != null && response.user != null) {
        return my_auth.AuthUser.fromJson(response.user!.toJson());
      }

      // If no session but user exists, email confirmation is required
      if (response.session == null && response.user != null) {
        // For development, we'll still return the user object
        // In production, you might want to handle email confirmation differently
        return my_auth.AuthUser.fromJson(response.user!.toJson());
      }

      throw Exception('Registrasi gagal. Silakan coba lagi.');
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }

  // Sign in with email and password
  Future<my_auth.AuthUser> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Login gagal. Email atau password salah.');
      }

      return my_auth.AuthUser.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Terjadi kesalahan saat logout: ${e.toString()}');
    }
  }

  // Reset password
  Future<void> resetPassword({required String email}) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }

  // Update user profile
  Future<my_auth.AuthUser> updateProfile({
    String? displayName,
    String? photoUrl,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (displayName != null) updates['display_name'] = displayName;
      if (photoUrl != null) updates['avatar_url'] = photoUrl;

      final response = await _supabase.auth.updateUser(
        UserAttributes(data: updates),
      );

      if (response.user == null) {
        throw Exception('Gagal memperbarui profil.');
      }

      return my_auth.AuthUser.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }

  // Change password
  Future<void> changePassword({required String newPassword}) async {
    try {
      await _supabase.auth.updateUser(
        UserAttributes(password: newPassword),
      );
    } on AuthException catch (e) {
      throw _handleAuthException(e);
    } catch (e) {
      throw Exception('Terjadi kesalahan: ${e.toString()}');
    }
  }

  // Handle Supabase Auth Exceptions
  Exception _handleAuthException(AuthException e) {
    switch (e.statusCode) {
      case '400':
        if (e.message.contains('email')) {
          return Exception('Format email tidak valid.');
        } else if (e.message.contains('password')) {
          return Exception('Password minimal 6 karakter.');
        }
        return Exception('Data yang dimasukkan tidak valid.');

      case '422':
        if (e.message.contains('already registered')) {
          return Exception(
              'Email sudah terdaftar. Silakan login atau gunakan email lain.');
        }
        return Exception('Email sudah terdaftar.');

      case '401':
        return Exception('Email atau password salah.');

      case '429':
        return Exception(
            'Terlalu banyak percobaan. Silakan tunggu 30 detik lalu coba lagi.');

      case 'signup_disabled':
        return Exception('Registrasi sedang tidak tersedia.');

      case 'email_not_confirmed':
        return Exception('Silakan verifikasi email Anda terlebih dahulu.');

      default:
        // Handle specific rate limiting messages
        if (e.message.contains('too_many_requests') ||
            e.message.contains('rate_limit') ||
            e.message.toLowerCase().contains('too many')) {
          return Exception(
              'Terlalu banyak percobaan. Silakan tunggu 1-2 menit lalu coba lagi.');
        }

        return Exception(e.message.isEmpty
            ? 'Terjadi kesalahan yang tidak diketahui.'
            : e.message);
    }
  }
}
