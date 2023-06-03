import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/news/statemangment/bloc/news_bloc.dart';
import 'package:new_app/modules/news/widgets/article_widget.dart';

class EverythingListScreen extends StatelessWidget {
  const EverythingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewsBloc>(context);

        return ListView.builder(
          itemCount: bloc.everythingNews.length,
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: bloc.everythingNews[index],
            );
          },
        );
      },
    );
  }
}
