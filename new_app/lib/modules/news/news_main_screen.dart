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
          body: bloc.screens[bloc.currentIndex],
          floatingActionButton: bloc.currentIndex == 2
              ? FloatingActionButton(
                  onPressed: () {
                    bloc.add(SearchForNewsEvent(
                      searchQuery: bloc.searchController.text,
                      from: bloc.from.text,
                      to: bloc.to.text,
                    ));
                  },
                  child: const Icon(Icons.search),
                )
              : null,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bloc.currentIndex,
            onTap: (index) {
              bloc.add(ChangeBottomNavIndex(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Eevrything',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Top Headlines',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.filter_alt_rounded),
                label: 'Filter',
              ),
            ],
          ),
        );
      },
    );
  }
}
