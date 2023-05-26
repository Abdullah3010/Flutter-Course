part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class ChangeBottomNavIndex extends NewsEvent {
  final int index;

  ChangeBottomNavIndex(this.index);
  @override
  List<Object?> get props => [index];
}

class GetAllNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
