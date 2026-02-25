import 'package:flutter/cupertino.dart';
import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class HomeController extends ChangeNotifier {
  HomeController(){
    callTopHeadLines();
    callEverything();
  }

  List<NewsArticleModel> newsTopHeadLinesList = [];
  List<NewsArticleModel> newsEverythingList = [];
  ApiService apiService = ApiService();

  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;

  bool topHeadLinesLoading = true;
  String? errorMessage;
  String? selectedCategory;

  callTopHeadLines({String? category}) async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.topHeadlines,
        params: {'country': 'us',
          'category': category,},
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

      everythingStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      everythingStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }

    notifyListeners();
  }

  void updateCategories(String category){
    selectedCategory = category;
    callTopHeadLines(category: selectedCategory);
    notifyListeners();
  }
}
