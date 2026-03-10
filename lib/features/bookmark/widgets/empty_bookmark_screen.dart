import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';

class EmptyBookmarkScreen extends StatelessWidget {
  const EmptyBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border, size: AppSizes.w100, color: Colors.grey),
          SizedBox(height: AppSizes.ph16),
          Text('No bookmarks yet', style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: AppSizes.ph8),
          Text('Add bookmarks to see them here', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
