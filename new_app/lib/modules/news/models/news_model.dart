class NewsResponseModel {
  final String? status;
  final int? totalResults;
  final List<ArticlesModel>? articles;

  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'].map<ArticlesModel>((article) => ArticlesModel.fromJson(article)).toList(),
    );
  }
}

class ArticlesModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;
  final SourceModel? source;

  ArticlesModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: DateTime.tryParse(json['publishedAt'] ?? ''),
      content: json['content'] ?? '',
      source: SourceModel.fromJson(json['source']),
    );
  }
}

class SourceModel {
  final String? id;
  final String? name;

  SourceModel({
    required this.id,
    required this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
