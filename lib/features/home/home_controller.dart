import 'package:flutter/cupertino.dart';
import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/mixins/safe_notify_mixin.dart';
import 'package:news_app/features/home/models/news_article_model.dart';
import 'package:news_app/features/home/repos/news_repository.dart';

class HomeController extends ChangeNotifier with SafeNotify {
  HomeController(this.newsRepository){
    getTopHeadLines();
    getEverything();
  }

  BaseNewRepository newsRepository;

  List<NewsArticleModel> newsTopHeadLinesList = [];
  List<NewsArticleModel> newsEverythingList = [];

  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;
  RequestStatusEnum topHeadlineStatus = RequestStatusEnum.loading;

  String? errorMessage;
  String? selectedCategory;



  getTopHeadLines({String? category}) async {
    try {
      topHeadlineStatus = RequestStatusEnum.loading;
      safeNotify();

      newsTopHeadLinesList = await newsRepository.getTopHeadlines(category: category);

      topHeadlineStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      topHeadlineStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }

    safeNotify();
  }

  getEverything() async {
    try {
      newsEverythingList = await newsRepository.getEverything();

      everythingStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      everythingStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }

    safeNotify();
  }

  void updateCategories(String category){
    selectedCategory = category;
    getTopHeadLines(category: selectedCategory);
    safeNotify();
  }


}
