import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/theme/light_colors.dart';

class CustomBookmarkIconButton extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback? onTap;
  final Color? color;

  const CustomBookmarkIconButton({
    super.key,
    required this.isBookmarked,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color:
            isBookmarked ? LightColors.primaryColor : theme.colorScheme.primary,
        size: AppSizes.w26,
      ),
    );
  }
}

