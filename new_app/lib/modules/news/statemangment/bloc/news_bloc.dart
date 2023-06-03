import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/apis/dio_helper.dart';
import 'package:new_app/modules/news/everything_list_screen.dart';
import 'package:new_app/modules/news/filter_screen.dart';
import 'package:new_app/modules/news/models/news_model.dart';
import 'package:new_app/modules/news/top_headliens_list_screen.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();
  final List<Widget> screens = [
    const EverythingListScreen(),
    const TopheadlineListScreen(),
    FilterScreen(),
  ];
  List<ArticlesModel> everythingNews = [];
  List<ArticlesModel> topheadlineNews = [];
  List<ArticlesModel> filterNews = [];
  int currentIndex = 0;
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is ChangeBottomNavIndex) {
        currentIndex = event.index;
        emit(ChangeBottomNavIndexState(event.index));
      } else if (event is GetEverythingNewsEvent) {
        emit(GetEverythingNewsLoading());
        try {
          final dynamic response = await DioHelper.getEvrethingNews();
          final NewsResponseModel newsRes = NewsResponseModel.fromJson(response);
          everythingNews = newsRes.articles ?? [];
          emit(GetEverythingNewsDone());
        } catch (e) {
          emit(GetEverythingNewsError(errorMessage: e.toString()));
        }
      } else if (event is GetTopheadlineNewsEvent) {
        emit(GetTopheadlineNewsLoading());
        try {
          final dynamic response = await DioHelper.getTopheadlinesNews();
          final NewsResponseModel newsRes = NewsResponseModel.fromJson(response);
          topheadlineNews = newsRes.articles ?? [];
          emit(GetTopheadlineNewsDone());
        } catch (e) {
          emit(GetTopheadlineNewsError(errorMessage: e.toString()));
        }
      } else if (event is SearchForNewsEvent) {
        emit(SearchForNewsLoading());
        try {
          final dynamic response = await DioHelper.searchForNews(
            query: event.searchQuery,
            from: event.from,
            to: event.to,
          );
          final NewsResponseModel newsRes = NewsResponseModel.fromJson(response);
          filterNews = newsRes.articles ?? [];
          emit(SearchForNewsDone());
        } catch (e) {
          emit(SearchForNewsError(errorMessage: e.toString()));
        }
      }
    });
  }
}
