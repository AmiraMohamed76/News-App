import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class NewsItem extends StatelessWidget {
  final NewsArticleModel item;

  const NewsItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomCachedNetworkImage(imagePath: item.urlToImage ?? ""),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    color: Color(0xFF141414),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    if (item.urlToImage != null)
                      CircleAvatar(
                        backgroundImage: NetworkImage(item.urlToImage!),
                        radius: 10,
                      ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            (item.author ?? "Not Found").substring(
                              0,
                              min((item.author ?? "Not Found").length, 10),
                            ),
                            style: TextStyle(
                              color: Color(0xFF141414),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              item.publishedAt.formatDateTime(),
                              style: TextStyle(
                                color: Color(0xFF141414),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          CustomSvgPicture.withoutColor(imagePath: 'assets/images/bookmark.svg'),
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
