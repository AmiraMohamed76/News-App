import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';

class ViewAllComponent extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Function onTap;

  const ViewAllComponent({
    super.key,
    required this.title,
    this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: titleColor ?? Theme.of(context).colorScheme.primary,)
          ),
          InkWell(
            onTap: () => onTap(),
            child: Text(
              "View all",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: titleColor ?? Theme.of(context).colorScheme.primary,
                decorationColor: titleColor ?? Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
