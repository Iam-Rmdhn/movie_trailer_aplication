import 'package:movie_app/core/utils/app_images_assets.dart';

class DownloadMovieModel {
  final String title;
  final String time;
  final String size;
  final String movieImage;

  DownloadMovieModel({
    required this.title,
    required this.movieImage,
    required this.size,
    required this.time,
  });

  static List<DownloadMovieModel> getDownloadMovie() {
    return [
      DownloadMovieModel(
        title: 'Lightyear',
        movieImage: AppImageAssets.imagesDownloadMovieOne,
        size: '1.4 GB',
        time: '1h 42m 33s',
      ),
      DownloadMovieModel(
        title: 'Top Gun: Maverick',
        movieImage: AppImageAssets.imagesDownloadMovieTwo,
        size: '1.4 GB',
        time: '1h 42m 33s',
      ),
      DownloadMovieModel(
        title: 'Thor: Love & Thunder',
        movieImage: AppImageAssets.imagesDownloadMovieThree,
        size: '1.4 GB',
        time: '1h 42m 33s',
      ),
      DownloadMovieModel(
        title: 'Stranger Things 4 : Episode 5',
        movieImage: AppImageAssets.imagesDownloadMovieFour,
        size: '1.4 GB',
        time: '1h 42m 33s',
      ),
      DownloadMovieModel(
        title: 'Avatar: The way of Water',
        movieImage: AppImageAssets.imagesDownloadMovieFive,
        size: '1.4 GB',
        time: '1h 42m 33s',
      ),
      DownloadMovieModel(
        title: 'Doctor Strange',
        movieImage: AppImageAssets.imagesDownloadMovieSix,
        size: '1.4 GB',
        time: '1h 42m 33s',
      ),
    ];
  }
}
