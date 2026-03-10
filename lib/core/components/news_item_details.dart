import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/core/widgets/custom_bookmark_icon_button.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/features/bookmark/controller/bookmark_controller.dart';
import 'package:news_app/features/home/models/news_article_model.dart';
import 'package:provider/provider.dart';

class NewsItemDetails extends StatelessWidget {
  final NewsArticleModel item;
  bool detailsText;

  NewsItemDetails({super.key, required this.item, this.detailsText = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.r4),
          child: CustomCachedNetworkImage(
            imagePath: item.urlToImage ?? "",
            height: AppSizes.h230,
            width: double.infinity,
          ),
        ),
        SizedBox(height: AppSizes.ph12),
        Text(
          item.title,
          style: detailsText
              ? theme.textTheme.titleMedium!.copyWith(color: theme.colorScheme.primary)
              : theme.textTheme.labelLarge!.copyWith(color: theme.colorScheme.primary),
        ),
        SizedBox(height: AppSizes.ph12),
        Row(
          children: [
            if (item.urlToImage != null)
              CircleAvatar(
                backgroundImage: NetworkImage(item.urlToImage!),
                radius: AppSizes.r16,
              ),
            SizedBox(width: AppSizes.pw4),
            Expanded(
              child: Row(
                children: [
                  Text(
                    (item.author ?? "Not Found").substring(
                      0,
                      min((item.author ?? "Not Found").length, 10),
                    ),
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: theme.colorScheme.onSecondary,
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(width: AppSizes.pw12),
                  Expanded(
                    child: Text(
                      item.publishedAt.formatDateTime(),
                      style: theme.textTheme.labelSmall!.copyWith(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  Consumer<BookmarkController>(
                    builder: (context, controller, _) {
                      final isBookmarked = controller.isBookmarked(item);
                      return CustomBookmarkIconButton(
                        isBookmarked: isBookmarked,
                        onTap: () => controller.toggleBookmark(item),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.ph14),
      ],
    );
  }
}
