import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticleModel item;

  const NewsDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("News Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.pw16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: CustomCachedNetworkImage(
                  imagePath: item.urlToImage ?? "",
                  height: AppSizes.h230,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: AppSizes.ph12),
              Text(item.title, style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary
              )),
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
                        CustomSvgPicture.withoutColor(
                          imagePath: 'assets/images/bookmark.svg',
                          height: AppSizes.h24,
                          width: AppSizes.w24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.ph14),
              Text(
                item.description ?? "",
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
