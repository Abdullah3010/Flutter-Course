part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class ChangeBottomNavIndex extends NewsEvent {
  final int index;

  ChangeBottomNavIndex(this.index);
  @override
  List<Object?> get props => [index];
}

class GetEverythingNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class GetTopheadlineNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class SearchForNewsEvent extends NewsEvent {
  final String? searchQuery;
  final String? from;
  final String? to;

  SearchForNewsEvent({
    this.searchQuery,
    this.from,
    this.to,
  });
  @override
  List<Object?> get props => [];
}
