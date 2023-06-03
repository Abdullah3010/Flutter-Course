import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/news/statemangment/bloc/news_bloc.dart';
import 'package:new_app/modules/news/widgets/article_widget.dart';

class TopheadlineListScreen extends StatelessWidget {
  const TopheadlineListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewsBloc>(context);
        print(state);
        return ListView.builder(
          itemCount: bloc.topheadlineNews.length,
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: bloc.topheadlineNews[index],
            );
          },
        );
      },
    );
  }
}
