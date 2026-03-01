import 'package:flutter/cupertino.dart';
import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class HomeController extends ChangeNotifier {
  HomeController(){
    getTopHeadLines();
    getEverything();
  }

  List<NewsArticleModel> newsTopHeadLinesList = [];
  List<NewsArticleModel> newsEverythingList = [];
  ApiService apiService = ApiService();

  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;
  RequestStatusEnum topHeadlineStatus = RequestStatusEnum.loading;

  String? errorMessage;
  String? selectedCategory;

  getTopHeadLines({String? category}) async {
    try {
      topHeadlineStatus = RequestStatusEnum.loading;
      notifyListeners();

      Map<String, dynamic> result = await apiService.get(
        ApiConfig.topHeadlines,
        params: {'country': 'us',
          'category': category,},
      );

      newsTopHeadLinesList = (result['articles'] as List)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList();
      topHeadlineStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      topHeadlineStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }

    notifyListeners();
  }

  getEverything() async {
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
    getTopHeadLines(category: selectedCategory);
    notifyListeners();
  }
}
