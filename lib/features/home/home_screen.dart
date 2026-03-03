import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/core/services/theme_controller.dart';
import 'package:news_app/features/home/components/categories_list.dart';
import 'package:news_app/features/home/components/top_headline.dart';
import 'package:news_app/features/home/components/trending_news.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:news_app/features/home/repos/news_repository.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(NewsRepository(ApiService())),
      child: Consumer<HomeController>(
        builder:
            (BuildContext context, HomeController controller, Widget? child) {
              return Scaffold(
                body: Column(
                  children: [
                    SizedBox(height: 20,),
                    ValueListenableBuilder<ThemeMode>(
                    valueListenable: ThemeController.themeNotifier,
                    builder: (BuildContext context, value, Widget? child) {
                      return Switch(
                        value: value == ThemeMode.dark,
                        // check if theme is dark (true) or light (false)
                        onChanged: (bool value) async {
                          ThemeController.toggleTheme();
                        },
                      );
                    },
                  ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          TrendingNews(),
                          CategoriesList(),
                          TopHeadline(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
      ),
    );
  }
}
