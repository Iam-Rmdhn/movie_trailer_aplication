import 'package:flutter/material.dart';
import 'package:movie_app/feature/explore/presentation/views/filtaration_dialoge_view.dart';

void showFilterationDialoge(
  BuildContext context,
) {
  showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0xff09101D).withOpacity(0.7),
      builder: (context) {
        return const FiltarationDialogeView();
      });
}
