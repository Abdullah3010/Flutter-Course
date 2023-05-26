import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_app/core/apis/dio_helper.dart';
import 'package:new_app/modules/news/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<ArticlesModel> news = [];
  int currentIndex = 0;
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is ChangeBottomNavIndex) {
        currentIndex = event.index;
        emit(ChangeBottomNavIndexState(event.index));
      } else if (event is GetAllNewsEvent) {
        emit(GetAllNewsLoading());
        try {
          final dynamic response = await DioHelper.getAllNews();
          final NewsResponseModel newsRes = NewsResponseModel.fromJson(response);
          news = newsRes.articles ?? [];
          emit(GetAllNewsDone());
        } catch (e) {
          emit(GetAllNewsError(errorMessage: e.toString()));
        }
      }
    });
  }
}
