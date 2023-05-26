import 'package:flutter/material.dart';
import 'package:new_app/modules/news/models/news_model.dart';
import 'package:intl/intl.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    super.key,
    required this.article,
  });

  final ArticlesModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                article.author ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(DateFormat('HH:mm').format(article.publishedAt!)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            article.title ?? '',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(article.content ?? ''),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              article.urlToImage ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
