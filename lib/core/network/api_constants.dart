class ApiConstants {
  // Base URL untuk TMDB API
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
  static const String originalImageBaseUrl =
      'https://image.tmdb.org/t/p/original';

  // API Key v3 dari TMDB
  static const String apiKey = 'ad45a3becb50cec32621e14a568684fd';

  // Endpoints
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String upcomingMovies = '/movie/upcoming';
  static const String searchMovies = '/search/movie';
  static const String movieDetails = '/movie';
  static const String movieGenres = '/genre/movie/list';

  // Helper method untuk membuat URL lengkap dengan API key
  static String getMoviesUrl(String endpoint,
      {Map<String, dynamic>? queryParams}) {
    final params = queryParams ?? {};
    params['api_key'] = apiKey;
    params['language'] = 'id-ID'; // Bahasa Indonesia

    final queryString =
        params.entries.map((e) => '${e.key}=${e.value}').join('&');

    return '$baseUrl$endpoint?$queryString';
  }

  // Helper method untuk mendapatkan URL gambar lengkap
  static String getImageUrl(String? imagePath, {bool isOriginal = false}) {
    if (imagePath == null || imagePath.isEmpty) {
      return ''; // Return empty string or placeholder URL
    }
    final baseUrl = isOriginal ? originalImageBaseUrl : imageBaseUrl;
    return '$baseUrl$imagePath';
  }
}
