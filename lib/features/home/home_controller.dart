import 'package:flutter/cupertino.dart';
import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class HomeController extends ChangeNotifier {
  HomeController(){
    callTopHeadLines();
    callEverything();
  }

  List<NewsArticleModel> newsTopHeadLinesList = [];
  List<NewsArticleModel> newsEverythingList = [];
  ApiService apiService = ApiService();
  bool topHeadLinesLoading = true;
  bool everythingLoading = true;
  String? errorMessage;

  callTopHeadLines() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.topHeadlines,
        params: {'country': 'us'},
      );

      newsTopHeadLinesList = (result['articles'] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      topHeadLinesLoading = false;
      errorMessage = null;
    } catch (e) {
      topHeadLinesLoading = false;
      errorMessage = e.toString();
    }

    notifyListeners();
  }

  callEverything() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.everything,
        params: {'q': 'news'},
      );

      newsEverythingList = (result['articles'] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      everythingLoading = false;
      errorMessage = null;
    } catch (e) {
      everythingLoading = false;
      errorMessage = e.toString();
    }

    notifyListeners();
  }
}
