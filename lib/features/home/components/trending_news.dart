import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/extensions/date_time_extension.dart';
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
        height: AppSizes.h290,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: AppSizes.h240,
              child: Image.asset(
                'assets/images/home_background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              top: AppSizes.ph40,
              child: Column(
                children: [
                  Text("NEWST", style: Theme.of(context).textTheme.titleLarge),
                  SizedBox(height: AppSizes.ph6),
                  ViewAllComponent(title: "Trending News", onTap: () {}, titleColor: Colors.white,),
                  SizedBox(height: AppSizes.ph12),
                  SizedBox(
                    height: AppSizes.h140,
                    child: Consumer<HomeController>(
                      builder:
                          (
                            BuildContext context,
                            HomeController controller,
                            Widget? child,
                          ) {
                            switch (controller.everythingStatus) {
                              case RequestStatusEnum.loading:
                                return TrendingNewsShimmer();
                              case RequestStatusEnum.error:
                                return Center(
                                  child: Text(controller.errorMessage!),
                                );
                              case RequestStatusEnum.loaded:
                                return ListView.separated(
                                  padding: EdgeInsets.only(left: AppSizes.ph16),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.newsEverythingList
                                      .take(6)
                                      .length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(width: AppSizes.pw12),
                                  itemBuilder: (context, index) {
                                    final item =
                                        controller.newsEverythingList[index];
                                    return Container(
                                      width: AppSizes.w260,
                                      height: AppSizes.h140,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          AppSizes.r12,
                                        ),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          AppSizes.r12,
                                        ),
                                        child: Stack(
                                          children: [
                                            CustomCachedNetworkImage(
                                              imagePath: item.urlToImage ?? "",
                                              width: AppSizes.w260,
                                              height: AppSizes.h140,
                                            ),
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        AppSizes.r12,
                                                      ),
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
                                              bottom: AppSizes.ph12,
                                              right: AppSizes.pw12,
                                              left: AppSizes.pw12,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.title,
                                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                                      color: Color(0xFFFFFCFC),
                                                      fontWeight: FontWeight.w700,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  SizedBox(
                                                    height: AppSizes.ph4,
                                                  ),
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
                                                              radius:
                                                                  AppSizes.r10,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  AppSizes.pw4,
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                item.author ??
                                                                    "Not Found",
                                                                style: Theme.of(context).textTheme.labelSmall!.copyWith( color: Color(0xFFFFFCFC),),
                                                                maxLines: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Text(
                                                        item.publishedAt
                                                            .formatDateTime(),
                                                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Color(0xFFFFFCFC),)
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
