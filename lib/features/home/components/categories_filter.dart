import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/services/theme_controller.dart';
import 'package:news_app/core/theme/light_colors.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class CategoriesFilter extends StatelessWidget {
   CategoriesFilter({super.key});

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
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController controller, Widget? child) {
        return Padding(
          padding: EdgeInsets.only(
            left: AppSizes.pw16,
            top: AppSizes.ph16,
            bottom: AppSizes.ph16,
          ),
          child: SizedBox(
            height: AppSizes.h35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              padding: EdgeInsets.only(right: AppSizes.pw16),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: AppSizes.pw12);
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
                            style:  Theme.of(context).textTheme.titleSmall!.copyWith(color: ThemeController.isDark()? DarkColors.darkGeryColor : LightColors.backColor,)
                        ),
                        if (isSelected) ...[
                          SizedBox(height: AppSizes.ph4),
                          Container(
                            height: AppSizes.h2,
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
        );
      },
    );
  }
}
