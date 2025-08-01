import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // Mock authentication - tidak menggunakan Firebase
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  // Mock Sign In
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // Simulasi delay network
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation - terima semua email/password untuk demo
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception('Email dan password tidak boleh kosong');
    }
  }

  // Mock Sign Up
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    // Simulasi delay network
    await Future.delayed(const Duration(seconds: 1));

    // Mock validation
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception('Email dan password tidak boleh kosong');
    }
  }

  // Mock Sign Out
  Future<void> signOut() async {
    _isLoggedIn = false;
    notifyListeners();
  }
}
