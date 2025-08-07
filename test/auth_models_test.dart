import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/auth/models/auth_models.dart';

void main() {
  group('Auth Models Tests', () {
    test('AuthUser.fromJson should parse user data correctly', () {
      final json = {
        'id': 'test-user-id',
        'email': 'test@example.com',
        'user_metadata': {
          'display_name': 'Test User',
          'avatar_url': 'https://example.com/avatar.jpg'
        },
        'created_at': '2023-01-01T00:00:00.000Z',
        'last_sign_in_at': '2023-01-02T00:00:00.000Z'
      };

      final user = AuthUser.fromJson(json);

      expect(user.id, equals('test-user-id'));
      expect(user.email, equals('test@example.com'));
      expect(user.displayName, equals('Test User'));
      expect(user.photoUrl, equals('https://example.com/avatar.jpg'));
    });

    test('AuthCredentials should store email and password', () {
      const credentials = AuthCredentials(
        email: 'test@example.com',
        password: 'password123',
      );

      expect(credentials.email, equals('test@example.com'));
      expect(credentials.password, equals('password123'));
    });

    test('RegisterCredentials should extend AuthCredentials', () {
      const credentials = RegisterCredentials(
        email: 'test@example.com',
        password: 'password123',
        displayName: 'Test User',
      );

      expect(credentials.email, equals('test@example.com'));
      expect(credentials.password, equals('password123'));
      expect(credentials.displayName, equals('Test User'));
    });
  });
}
