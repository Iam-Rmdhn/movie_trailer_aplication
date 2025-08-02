import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/data/models/movie_detail.dart';
import 'package:movie_app/core/data/models/tmdb_movie.dart';
import 'package:movie_app/core/network/api_constants.dart';

class MovieDetailService {
  static final MovieDetailService _instance = MovieDetailService._internal();
  factory MovieDetailService() => _instance;
  MovieDetailService._internal();

  final http.Client _client = http.Client();

  // Get Movie Detail
  Future<MovieDetail> getMovieDetail(int movieId) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.getMovieDetailsEndpoint(movieId),
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return MovieDetail.fromJson(data);
      } else {
        throw Exception('Failed to load movie detail: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movie detail: $e');
    }
  }

  // Get Movie Credits (Cast & Crew)
  Future<MovieCredits> getMovieCredits(int movieId) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.getMovieCreditsEndpoint(movieId),
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return MovieCredits.fromJson(data);
      } else {
        throw Exception('Failed to load movie credits: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movie credits: $e');
    }
  }

  // Get Movie Videos (Trailers)
  Future<MovieVideos> getMovieVideos(int movieId) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.getMovieVideosEndpoint(movieId),
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return MovieVideos.fromJson(data);
      } else {
        throw Exception('Failed to load movie videos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movie videos: $e');
    }
  }

  // Get Similar Movies
  Future<TMDBMoviesResponse> getSimilarMovies(int movieId,
      {int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.getSimilarMoviesEndpoint(movieId),
        queryParams: {'page': page},
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception(
            'Failed to load similar movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching similar movies: $e');
    }
  }

  // Get Movie Recommendations
  Future<TMDBMoviesResponse> getMovieRecommendations(int movieId,
      {int page = 1}) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.getRecommendationsEndpoint(movieId),
        queryParams: {'page': page},
      );

      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TMDBMoviesResponse.fromJson(data);
      } else {
        throw Exception(
            'Failed to load movie recommendations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching movie recommendations: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
