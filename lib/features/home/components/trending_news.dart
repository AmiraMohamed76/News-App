import 'package:flutter/material.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/core/widgets/custom_cached_network_image.dart';
import 'package:news_app/features/home/components/trending_news_shimmer.dart';
import 'package:news_app/features/home/components/view_all_component.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 290,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: Image.asset(
                'assets/images/home_background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              top: 40,
              child: Column(
                children: [
                  Text(
                    "NEWST",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: LightColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  ViewAllComponent(title: "Trending News", onTap: () {}),
                  SizedBox(height: 12),
                  SizedBox(
                    height: 140,
                    child: Consumer<HomeController>(
                      builder:
                          (BuildContext context, HomeController controller, Widget? child) {
                            switch (controller.everythingStatus) {
                              case RequestStatusEnum.loading:
                                return TrendingNewsShimmer();
                              case RequestStatusEnum.error:
                                return Center(
                                  child: Text(controller.errorMessage!),
                                );
                              case RequestStatusEnum.loaded:
                                return ListView.separated(
                                  padding: EdgeInsets.only(left: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.newsEverythingList
                                      .take(6)
                                      .length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(width: 12),
                                  itemBuilder: (context, index) {
                                    final item =
                                        controller.newsEverythingList[index];
                                    return Container(
                                      width: 260,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Stack(
                                          children: [
                                            CustomCachedNetworkImage(
                                              imagePath: item.urlToImage ?? "",
                                              width: 260,
                                              height: 140,
                                            ),
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.black.withValues(
                                                        alpha: 0.5,
                                                      ),
                                                      Colors.black.withValues(
                                                        alpha: 0.7,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 12,
                                              right: 12,
                                              left: 12,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.title,
                                                    style: TextStyle(
                                                      color: Color(0xFFFFFCFC),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 14,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                    item.urlToImage
                                                                        .toString(),
                                                                  ),
                                                              radius: 10,
                                                            ),
                                                            SizedBox(width: 4),
                                                            Expanded(
                                                              child: Text(
                                                                item.author ??
                                                                    "Not Found",
                                                                style: TextStyle(
                                                                  color: Color(
                                                                    0xFFFFFCFC,
                                                                  ),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 12,
                                                                ),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        item.publishedAt
                                                            .formatDateTime(),
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xFFFFFCFC,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                            }
                          },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
