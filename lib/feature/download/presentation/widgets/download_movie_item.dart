import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/feature/download/data/model/download_movie_model.dart';

class DownloadMovieItem extends StatelessWidget {
  final DownloadMovieModel movieModel;
  const DownloadMovieItem({
    super.key,
    required this.movieModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                movieModel.movieImage,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: SvgPicture.asset(
                  AppImageAssets.imagesIconPlay,
                  width: 25,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieModel.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppDynamicColorBuilder.getGrey900AndWhite(context),
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                movieModel.time,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color:
                          AppDynamicColorBuilder.getGrey800AndGrey300(context),
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.red.withOpacity(0.4),
                    ),
                    child: Text(
                      movieModel.size,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      AppImageAssets.imagesIconTrash,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
