import 'package:flutter/cupertino.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/mixins/safe_notify_mixin.dart';
import 'package:news_app/features/home/models/news_article_model.dart';
import 'package:news_app/features/home/repos/news_repository.dart';

class NewsSearchController extends ChangeNotifier with SafeNotify{
  NewsSearchController(this.newsRepository);

  TextEditingController searchController = TextEditingController();

  final BaseNewRepository newsRepository;
  List<NewsArticleModel> newsEverythingList = [];

  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;
  String? errorMessage;



  getEverything() async {
    try {
      newsEverythingList = await newsRepository.getEverything(query: searchController.text);

      everythingStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      everythingStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }

    safeNotify();
  }

}