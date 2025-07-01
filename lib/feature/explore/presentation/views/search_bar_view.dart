import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_images_assets.dart';
import 'package:movie_app/feature/explore/presentation/views/show_filteration_dialoge.dart';
import 'package:movie_app/feature/explore/presentation/widgets/custome_text_form_field.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomeTextFormField(),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            showFilterationDialoge(context);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(AppImageAssets.imagesIconFilter),
          ),
        ),
      ],
    );
  }
}
