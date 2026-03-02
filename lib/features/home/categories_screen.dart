import 'package:flutter/material.dart';
import 'package:news_app/features/home/components/categories_filter.dart';
import 'package:news_app/features/home/components/news_item.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),),
      body: Consumer<HomeController>(
        builder: (BuildContext context, HomeController controller, Widget? child) {
          return Column(
            children: [
              CategoriesFilter(),
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
