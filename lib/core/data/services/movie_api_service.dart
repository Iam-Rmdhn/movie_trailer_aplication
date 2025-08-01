import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/network/api_constants.dart';

class MovieApiService {
  static final MovieApiService _instance = MovieApiService._internal();
  factory MovieApiService() => _instance;
  MovieApiService._internal();

  final http.Client _client = http.Client();

  // Get Popular Movies
  Future<TMDBMoviesResponse> getPopularMovies({int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.popularMovies,
        queryParams: {'page': page},
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception(
            'Failed to load popular movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching popular movies: $e');
    }
  }

  // Get Top Rated Movies
  Future<TMDBMoviesResponse> getTopRatedMovies({int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.topRatedMovies,
        queryParams: {'page': page},
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception(
            'Failed to load top rated movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching top rated movies: $e');
    }
  }

  // Get Now Playing Movies
  Future<TMDBMoviesResponse> getNowPlayingMovies({int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.nowPlayingMovies,
        queryParams: {'page': page},
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception(
            'Failed to load now playing movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching now playing movies: $e');
    }
  }

  // Get Upcoming Movies
  Future<TMDBMoviesResponse> getUpcomingMovies({int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.upcomingMovies,
        queryParams: {'page': page},
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception(
            'Failed to load upcoming movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching upcoming movies: $e');
    }
  }

  // Search Movies
  Future<TMDBMoviesResponse> searchMovies(String query, {int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.searchMovies,
        queryParams: {
          'query': query,
          'page': page,
        },
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception('Failed to search movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching movies: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
