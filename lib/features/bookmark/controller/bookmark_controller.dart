import 'package:flutter/cupertino.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/mixins/safe_notify_mixin.dart';
import 'package:news_app/features/bookmark/models/bookmark_model.dart';
import 'package:news_app/features/bookmark/repository/bookmark_repository.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class BookmarkController extends ChangeNotifier with SafeNotify {
  final BookmarkRepository _repository = BookmarkRepository();

  List<BookmarkModel> bookmarks = [];


  RequestStatusEnum bookMarkStatus = RequestStatusEnum.loaded;

  String? errorMessage;

  String searchQuery = '';
  bool isSearching = false;

  BookmarkController(){
    loadBookmarks();
  }

  void loadBookmarks() async {
    try {
      bookMarkStatus = RequestStatusEnum.loading;
      safeNotify();

      if (searchQuery.isEmpty) {
        bookmarks = _repository.getBookmarks();
      } else {
        bookmarks = _repository.searchBookmarks(searchQuery);
      }

      bookMarkStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      bookMarkStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }

    safeNotify();
  }

  void refreshBookmarks() async {
    loadBookmarks();
  }

  bool isBookmarked(NewsArticleModel article) {
    return _repository.isBookmarked(article);
  }

  Future<void> toggleBookmark(NewsArticleModel article) async {
    await _repository.toggleBookmark(article);
    loadBookmarks();
  }

  void search(String query) {
    searchQuery = query;
    loadBookmarks();
  }
}

