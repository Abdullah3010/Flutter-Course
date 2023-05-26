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

class GetAllNewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetAllNewsDone extends NewsState {
  @override
  List<Object?> get props => [];
}

class GetAllNewsError extends NewsState {
  final String errorMessage;

  GetAllNewsError({
    required this.errorMessage,
  });
  @override
  List<Object?> get props => [errorMessage];
}
