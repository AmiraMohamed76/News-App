import 'package:news_app/core/data_source/remote_data/api_config.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

abstract class BaseNewRepository{
  Future<List<NewsArticleModel>> getTopHeadlines({String? category = 'general'});
  Future<List<NewsArticleModel>> getEverything({String? query = 'news'});
}

class NewsRepository extends BaseNewRepository{

  NewsRepository(this.apiService);

  final BaseApiService apiService;

  @override
  Future<List<NewsArticleModel>> getTopHeadlines({String? category = 'general'}) async{

    Map<String, dynamic> result = await apiService.get(
      ApiConfig.topHeadlines,
      params: {'country': 'us',
        'category': category,},
    );

    return (result['articles'] as List)
        .map((e) => NewsArticleModel.fromJson(e))
        .toList();
  }


  @override
  Future<List<NewsArticleModel>> getEverything({String? query = 'news'}) async{

    Map<String, dynamic> result = await apiService.get(
      ApiConfig.everything,
      params: {'q': query },
    );

    return (result['articles'] as List)
        .map((e) => NewsArticleModel.fromJson(e))
        .toList();
  }
}