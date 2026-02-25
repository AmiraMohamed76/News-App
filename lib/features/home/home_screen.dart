import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/features/home/components/categories_list.dart';
import 'package:news_app/features/home/components/trending_news.dart';
import 'package:news_app/features/home/components/view_all_component.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(),
      child: Consumer<HomeController>(
        builder:
            (BuildContext context, HomeController controller, Widget? child) {
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    TrendingNews(),
                    SliverToBoxAdapter(
                      child: ViewAllComponent(
                        title: "Categories",
                        titleColor: Color(0xFF141414),
                        onTap: () {},
                      ),
                    ),
                    CategoriesList(),
                    SliverList.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.newsTopHeadLinesList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  width: 140,
                                  height: 85,
                                  item.urlToImage ?? "https://www.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584287.jpg",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/no_image_found.png",
                                      width: 140,
                                      height: 85,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        if(item.urlToImage ==null)  CircleAvatar(
                                          backgroundImage: AssetImage('assets/images/no_image_found.png'),
                                          radius: 10,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            item.urlToImage!
                                          ),
                                          radius: 10,
                                        ),
                                        SizedBox(width: 4),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Text(
                                                (item.author ?? "Not Found")
                                                    .substring(0, min((item.author ??"Not Found").length, 10,),),
                                                style: TextStyle(
                                                  color: Color(0xFF141414),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(
                                                formatDateTime(item.publishedAt),
                                                style: TextStyle(
                                                  color: Color(0xFF141414),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
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
                      },
                    ),
                  ],
                ),
              );
            },
      ),
    );
  }

  String formatDateTime(String? date) {
    if (date == null) return "";
    final diff = DateTime.now().difference(DateTime.parse(date));

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    }

    if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    }
    return '${diff.inDays}d ago';
  }
}
