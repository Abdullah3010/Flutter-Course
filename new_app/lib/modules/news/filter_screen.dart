import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_app/modules/news/statemangment/bloc/news_bloc.dart';
import 'package:new_app/modules/news/widgets/article_widget.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NewsBloc>(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: bloc.searchController,
                          decoration: const InputDecoration(
                            labelText: 'Search',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    final fromatedDate = DateFormat('dd MMM yyyy').format(value!);
                                    bloc.from.text = fromatedDate;
                                  });
                                },
                                child: TextFormField(
                                  controller: bloc.from,
                                  decoration: const InputDecoration(
                                    labelText: 'from',
                                    enabled: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    final fromatedDate = DateFormat('dd MMM yyyy').format(value!);
                                    bloc.to.text = fromatedDate;
                                  });
                                },
                                child: TextFormField(
                                  controller: bloc.to,
                                  decoration: const InputDecoration(
                                    labelText: 'to',
                                    enabled: false,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  itemCount: bloc.filterNews.length,
                  itemBuilder: (context, index) {
                    return ArticleWidget(
                      article: bloc.filterNews[index],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
