import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';

class PremiumCardView extends StatelessWidget {
  const PremiumCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(AppImageAssets.imagesIconPremium),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Join Premium!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                          textAlign: TextAlign.left),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Enjoy watching Full-HD movies, \nwithout restrictions and without ads',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppDynamicColorBuilder.getGrey700AndGrey300(
                                context)),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SvgPicture.asset(AppImageAssets.imagesIconArrowRight),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
