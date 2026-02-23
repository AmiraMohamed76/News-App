import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (BuildContext context, HomeController value, Widget? child) {
          return  Scaffold(
            body: value.errorMessage?.isNotEmpty ?? false
                ? Center(child: Text(value.errorMessage!))
                : value.topHeadLinesLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.newsTopHeadLinesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(value.newsTopHeadLinesList[index].title);
                    },
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
