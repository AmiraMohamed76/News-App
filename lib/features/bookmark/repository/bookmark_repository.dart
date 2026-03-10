import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/core/constants/storage_key.dart';
import 'package:news_app/features/bookmark/models/bookmark_model.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

class BookmarkRepository {
  BookmarkRepository._internal();

  static final BookmarkRepository _instance = BookmarkRepository._internal();

  factory BookmarkRepository() => _instance;

  Box<BookmarkModel>? _bookmarkBox;

  Box<BookmarkModel> get bookmarkBox {
    if (_bookmarkBox == null) {
      throw Exception("BookmarkBox is not initialized");
    }
    return _bookmarkBox!;
  }

  Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(BookmarkModelAdapter());
    }
    _bookmarkBox = await Hive.openBox<BookmarkModel>(StorageKey.bookmarkBox);
  }

  String _keyForBookmark(BookmarkModel bookmark) {
    // Prefer URL as unique identifier, fall back to title
    return bookmark.url ?? bookmark.title;
  }

  Future<void> addBookmark(NewsArticleModel newsArticle) async {
    final bookmark = toBookmarkModel(newsArticle);
    final key = _keyForBookmark(bookmark);
    await bookmarkBox.put(key, bookmark);
  }

  Future<void> removeBookmark(NewsArticleModel newsArticle) async {
    final bookmark = toBookmarkModel(newsArticle);
    final key = _keyForBookmark(bookmark);
    await removeBookmarkByKey(key);
  }

  Future<void> removeBookmarkByKey(String key) async {
    await bookmarkBox.delete(key);
  }

  bool isBookmarked(NewsArticleModel newsArticle) {
    final bookmark = toBookmarkModel(newsArticle);
    final key = _keyForBookmark(bookmark);
    return isBookmarkedByKey(key);
  }

  bool isBookmarkedByKey(String key) {
    return bookmarkBox.containsKey(key);
  }

  Future<void> toggleBookmark(NewsArticleModel newsArticle) async {
    final bookmark = toBookmarkModel(newsArticle);
    final key = _keyForBookmark(bookmark);
    if (isBookmarkedByKey(key)) {
      await removeBookmark(newsArticle);
    } else {
      await addBookmark(newsArticle);
    }
  }

  List<BookmarkModel> getBookmarks() {
    return bookmarkBox.values.toList();
  }

  List<BookmarkModel> searchBookmarks(String query) {
    if (query.isEmpty) return getBookmarks();

    final lowerQuery = query.toLowerCase();

    return bookmarkBox.values.where((bookmark) {
      final title = bookmark.title.toLowerCase();
      final description = (bookmark.description ?? '').toLowerCase();
      final url = (bookmark.url ?? '').toLowerCase();
      final author = (bookmark.author ?? '').toLowerCase();

      return title.contains(lowerQuery) ||
          description.contains(lowerQuery) ||
          url.contains(lowerQuery) ||
          author.contains(lowerQuery);
    }).toList()..sort((a, b) => b.bookmarkedAt!.compareTo(a.bookmarkedAt!));
  }

  Future<void> clearBookmarks() async {
    await bookmarkBox.clear();
  }

  BookmarkModel toBookmarkModel(NewsArticleModel article) {
    return BookmarkModel(
      author: article.author,
      title: article.title,
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      bookmarkedAt: DateTime.now(),
      content: article.content,
    );
  }
}
