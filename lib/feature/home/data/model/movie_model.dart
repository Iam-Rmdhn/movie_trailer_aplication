import 'package:movie_app/core/utils/app_images_assets.dart';

class MovieModel {
  final String url;
  final double rate;

  MovieModel({required this.url, required this.rate});

  static List<MovieModel> getAllTopMovie() {
    return [
      MovieModel(url: AppImageAssets.imagesNewMovieRed, rate: 7.2),
      MovieModel(url: AppImageAssets.imagesNewMovieThor, rate: 9.2),
      MovieModel(url: AppImageAssets.imagesNewMovieMorius, rate: 8.2),
      MovieModel(url: AppImageAssets.imagesNewMovieAdam, rate: 6.2),
      MovieModel(url: AppImageAssets.imagesNewMovieMoon, rate: 7.5),
    ];
  }

  static List<MovieModel> getAllNewReleasesMovie() {
    return [
      MovieModel(url: AppImageAssets.imagesAvater, rate: 7.2),
      MovieModel(url: AppImageAssets.imagesBatman, rate: 9.2),
      MovieModel(url: AppImageAssets.imagesMoonMan, rate: 8.2),
      MovieModel(url: AppImageAssets.imagesTravel, rate: 6.2),
      MovieModel(url: AppImageAssets.imagesSonic, rate: 7.5),
    ];
  }
}
