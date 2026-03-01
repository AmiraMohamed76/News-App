import 'package:flutter/material.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/features/home/components/news_item.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<String> categories = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),),
      body: Consumer<HomeController>(
        builder: (BuildContext context, HomeController controller, Widget? child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 16,
                ),
                child: SizedBox(
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    padding: EdgeInsets.only(right: 16),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 12);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      bool isSelected =
                          categories[index] == controller.selectedCategory;
                      return GestureDetector(
                        onTap: () {
                          controller.updateCategories(categories[index]);
                        },
                        child: IntrinsicWidth(
                          child: Column(
                            children: [
                              Text(
                                categories[index][0].toUpperCase() +
                                    categories[index].substring(1),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF363636),
                                ),
                              ),
                              if (isSelected) ...[
                                SizedBox(height: 6),
                                Container(
                                  height: 2,
                                  color: LightColors.primaryColor,
                                ),
                              ],

                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.newsTopHeadLinesList[index];
                    return NewsItem(item: item);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
