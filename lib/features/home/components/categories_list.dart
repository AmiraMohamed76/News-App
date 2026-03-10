import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/features/home/categories_screen.dart';
import 'package:news_app/features/home/components/categories_filter.dart';
import 'package:news_app/features/home/components/view_all_component.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<HomeController>(
        builder:
            (BuildContext context, HomeController controller, Widget? child) {
              return Column(
                children: [
                  SizedBox(height: AppSizes.ph14),
                  ViewAllComponent(
                    title: "Categories",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext _) {
                            return ChangeNotifierProvider.value(
                              value: context.read<HomeController>(),
                              child: CategoriesScreen(),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  CategoriesFilter(),
                ],
              );
            },
      ),
    );
  }
}
