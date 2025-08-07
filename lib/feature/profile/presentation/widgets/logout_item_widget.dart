import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/feature/profile/data/model/profile_option_model.dart';

class LogoutItemWidget extends StatelessWidget {
  final ProfileOptionModel profileOptionModel;
  final VoidCallback onTap;

  const LogoutItemWidget({
    super.key,
    required this.profileOptionModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          onTap: onTap,
          leading: SvgPicture.asset(
            profileOptionModel.imagePath,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            profileOptionModel.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          minLeadingWidth: 24,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          visualDensity: const VisualDensity(vertical: 0),
        ),
      ),
    );
  }
}
