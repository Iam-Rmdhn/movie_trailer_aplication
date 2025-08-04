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

      print('Fetching credits from: $url'); // Debug log

      final response = await _client.get(Uri.parse(url));

      print('Credits API Response Status: ${response.statusCode}'); // Debug log

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(
            'Credits Data: ${data.toString().substring(0, data.toString().length > 200 ? 200 : data.toString().length)}...'); // Debug log
        final credits = MovieCredits.fromJson(data);
        print(
            'Credits parsed - Cast count: ${credits.cast.length}, Crew count: ${credits.crew.length}'); // Debug log
        return credits;
      } else {
        print(
            'Credits API Error: ${response.statusCode} - ${response.body}'); // Debug log
        throw Exception('Failed to load movie credits: ${response.statusCode}');
      }
    } catch (e) {
      print('Credits Exception: $e'); // Debug log
      throw Exception('Error fetching movie credits: $e');
    }
  }

  // Get Movie Videos (Trailers)
  Future<MovieVideos> getMovieVideos(int movieId) async {
    try {
      final url = ApiConstants.getMoviesUrl(
        ApiConstants.getMovieVideosEndpoint(movieId),
      );

      print('Fetching videos from: $url'); // Debug log

      final response = await _client.get(Uri.parse(url));

      print('Videos API Response Status: ${response.statusCode}'); // Debug log

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(
            'Videos Data: ${data.toString().substring(0, data.toString().length > 200 ? 200 : data.toString().length)}...'); // Debug log
        final videos = MovieVideos.fromJson(data);
        print(
            'Videos parsed - Total count: ${videos.results.length}'); // Debug log

        // Filter YouTube trailers
        final trailers = videos.results
            .where(
                (video) => video.type == 'Trailer' && video.site == 'YouTube')
            .toList();
        print('YouTube Trailers found: ${trailers.length}'); // Debug log

        return videos;
      } else {
        print(
            'Videos API Error: ${response.statusCode} - ${response.body}'); // Debug log
        throw Exception('Failed to load movie videos: ${response.statusCode}');
      }
    } catch (e) {
      print('Videos Exception: $e'); // Debug log
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
