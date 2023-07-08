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

class SendMessageLoading extends ChatState {}

class SendMessageSuccess extends ChatState {}

class SendMessageError extends ChatState {
  final String error;
  SendMessageError(this.error);
}
