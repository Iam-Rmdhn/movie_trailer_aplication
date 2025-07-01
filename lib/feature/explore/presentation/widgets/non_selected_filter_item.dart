import 'package:flutter/material.dart';

class NonSelectedFilterItem extends StatelessWidget {
  final String title;
  const NonSelectedFilterItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsetsDirectional.only(end: 15),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          width: 2,
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
