import 'package:hive_ce_flutter/adapters.dart';
import 'package:news_app/features/home/models/news_article_model.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 1)
class BookmarkModel {
  @HiveField(0)
  final String? author;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final String? url;

  @HiveField(4)
  final String? urlToImage;

  @HiveField(5)
  final DateTime publishedAt;

  @HiveField(6)
  final String? content;

   @HiveField(7)
  final DateTime? bookmarkedAt;

  BookmarkModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.bookmarkedAt,
  });


  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      author: json['author'] as String?,
      title: (json['title'] as String?) ?? '',
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: DateTime.tryParse(json['publishedAt'] as String? ?? '') ?? DateTime.now(),
      content: json['content'] as String?,
      bookmarkedAt: DateTime.tryParse(json['bookmarkedAt'] as String? ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toIso8601String(),
      'content': content,
      'bookmarkedAt': bookmarkedAt?.toIso8601String(),
    };
  }

   BookmarkModel copyWith({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
    DateTime? bookmarkedAt,
  }) {
    return BookmarkModel(
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      bookmarkedAt: bookmarkedAt ?? this.bookmarkedAt,
    );
  }

  NewsArticleModel toNewsArticle() {
    return NewsArticleModel(
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }


}

