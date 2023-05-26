class NewsApiEndpoints {
  static String NEWS_BASE_URL = 'https://newsapi.org';
  static String get everything => '$NEWS_BASE_URL/v2/everything';
  static String get topHeadline => '$NEWS_BASE_URL/v2/top-headlines';
}
