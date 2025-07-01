import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_color.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/core/utils/app_string.dart';

class ButtonActionView extends StatelessWidget {
  const ButtonActionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor:
                      AppDynamicColorBuilder.getPrimary100AndDark3(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Text(
                  AppString.reset,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color:
                            AppDynamicColorBuilder.getPrimaryAndWhite(context),
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppString.apply,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
