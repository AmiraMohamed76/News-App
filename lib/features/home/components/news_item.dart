import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class NewsItem extends StatelessWidget {
  final NewsArticleModel item;

  const NewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.pw16,
        vertical: AppSizes.ph8,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.r12),
            child: CustomCachedNetworkImage(imagePath: item.urlToImage ?? ""),
          ),
          SizedBox(width: AppSizes.pw8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSizes.ph4),
                Row(
                  children: [
                    if (item.urlToImage != null)
                      CircleAvatar(
                        backgroundImage: NetworkImage(item.urlToImage!),
                        radius: AppSizes.r10,
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
                            style: theme.textTheme.labelSmall!.copyWith(
                              color: theme.colorScheme.onSecondary,
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(width: AppSizes.pw4),
                          Expanded(
                            child: Text(
                              item.publishedAt.formatDateTime(),
                              style: theme.textTheme.labelMedium!.copyWith(
                                color: theme.colorScheme.onSecondary,
                              ),
                            ),
                          ),
                          CustomSvgPicture.withoutColor(
                            imagePath: 'assets/images/bookmark.svg',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
