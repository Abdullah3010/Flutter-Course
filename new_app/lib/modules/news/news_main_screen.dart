import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/modules/news/statemangment/bloc/news_bloc.dart';
import 'package:new_app/modules/news/widgets/article_widget.dart';

class NewsMainScreen extends StatelessWidget {
  const NewsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewsBloc>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
          ),
          body: ListView.builder(
            itemCount: bloc.news.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: bloc.news[index],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bloc.currentIndex,
            onTap: (index) {
              bloc.add(ChangeBottomNavIndex(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
            ],
          ),
        );
      },
    );
  }
}
