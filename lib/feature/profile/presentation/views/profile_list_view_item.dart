import 'package:flutter/material.dart';
import 'package:movie_app/feature/profile/data/model/profile_option_model.dart';
import 'package:movie_app/feature/profile/presentation/widgets/profile_item_widget.dart';

class ProfileListViewItem extends StatelessWidget {
  const ProfileListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: ProfileOptionModel.getAllProfileOptions().length,
      itemBuilder: (context, index) {
        return ProfileItemWidget(
          onTap: () {},
          profileOptionModel: ProfileOptionModel.getAllProfileOptions()[index],
        );
      },
    );
  }
}
