import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';

class StorageHelper {
  static late SharedPreferences sharedPreferences;

  //Here The Initialize of cache .
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // this fun to put data in local data base using key
  static Future<bool> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  // this fun to get data already saved in local data base
  static dynamic get({required String key}) {
    return sharedPreferences.get(key);
  }

  // remove data using specific key
  static Future<bool> removeData({required key}) async {
    return await sharedPreferences.remove(key);
  }

//clear all data in the local data base
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  // Save user's movie list
  static Future<bool> saveUserListMovies(List<TMDBMovie> movies) async {
    try {
      final moviesList = movies.map((movie) => movie.toJson()).toList();
      final jsonString = json.encode(moviesList);
      return await sharedPreferences.setString('user_movie_list', jsonString);
    } catch (e) {
      return false;
    }
  }

  // Get user's movie list
  static Future<List<TMDBMovie>> getUserListMovies() async {
    try {
      final jsonString = sharedPreferences.getString('user_movie_list');
      if (jsonString == null) return [];

      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => TMDBMovie.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  // Check if movie is in user list
  static Future<bool> isMovieInUserList(int movieId) async {
    try {
      final movies = await getUserListMovies();
      return movies.any((movie) => movie.id == movieId);
    } catch (e) {
      return false;
    }
  }
}
