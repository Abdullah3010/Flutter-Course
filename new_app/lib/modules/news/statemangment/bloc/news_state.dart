part of 'news_bloc.dart';

abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class ChangeBottomNavIndexState extends NewsState {
  final int index;

  ChangeBottomNavIndexState(this.index);
  @override
  List<Object?> get props => [index];
}

class GetEverythingNewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetEverythingNewsDone extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetEverythingNewsError extends NewsState {
  final String errorMessage;

  GetEverythingNewsError({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

class GetTopheadlineNewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetTopheadlineNewsDone extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetTopheadlineNewsError extends NewsState {
  final String errorMessage;

  GetTopheadlineNewsError({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}

class SearchForNewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class SearchForNewsDone extends NewsState {
  @override
  List<Object?> get props => [];
}

class SearchForNewsError extends NewsState {
  final String errorMessage;

  SearchForNewsError({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}
