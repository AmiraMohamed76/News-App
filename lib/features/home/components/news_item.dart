import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/core/services/theme_controller.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class NewsItem extends StatelessWidget {
  final NewsArticleModel item;

  const NewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

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
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: ThemeController.isDark()
                        ? DarkColors.whiteColor
                        : LightColors.backColor,
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
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ThemeController.isDark()
                                  ? DarkColors.geryColor
                                  : LightColors.backColor,
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(width: AppSizes.pw4),
                          Expanded(
                            child: Text(
                              item.publishedAt.formatDateTime(),
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: ThemeController.isDark()
                                    ? DarkColors.geryColor
                                    : LightColors.backColor,
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
