class NewsModel {
  String status;
  int totalResults;
  List<ArticlesModel> articlesModel;

  NewsModel(
      {required this.status,
        required this.totalResults,
        required this.articlesModel});

  factory NewsModel.fromJson(Map json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articlesModel: (json['articles'] as List).map<ArticlesModel>((article) => ArticlesModel.fromJson(article)).toList(),);
  }
}

class ArticlesModel {
  Source source;
  String author;
  String title;
  String description;
  String publishedAt;
  String urlToImage;

  ArticlesModel({required this.source, required this.author, required this.title, required this.description, required this.publishedAt, required this.urlToImage});

  factory ArticlesModel.fromJson(Map json){
    return ArticlesModel(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? "Public",
      title: json['title'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'] ?? "https://www.shutterstock.com/image-vector/breaking-news-background-world-global-260nw-719766118.jpg",
    );
  }
}

class Source {
  String id;
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map json) {
    return Source(
        id: json['id'] ?? 'NULL',
        name: json['name']);
  }
}
