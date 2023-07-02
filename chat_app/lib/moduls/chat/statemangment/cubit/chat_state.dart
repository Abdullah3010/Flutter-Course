part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class GetAllChatsLoading extends ChatState {}

class GetAllChatsSuccess extends ChatState {}

class GetAllChatsError extends ChatState {
  final String error;
  GetAllChatsError(this.error);
}
