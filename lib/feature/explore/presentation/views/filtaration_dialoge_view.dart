import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_dynamic_color.dart';
import 'package:movie_app/feature/explore/presentation/views/filteration_scroll_body_view.dart';

class FiltarationDialogeView extends StatelessWidget {
  const FiltarationDialogeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppDynamicColorBuilder.getWhiteAndDark2(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.3, // Initial size as a fraction of screen height
        minChildSize: 0.2, // Minimum size
        maxChildSize: 0.8,
        expand: false,
        builder: (context, scroll) {
          return FilterationScrollBodyView(
            scrollController: scroll,
          );
        },
      ),
    );
  }
}
