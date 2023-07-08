import 'package:bloc/bloc.dart';
import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/moduls/chat/models/main_chat_model.dart';
import 'package:chat_app/moduls/chat/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<MainChatModel>? chats;

  void getAllChats() {
    emit(GetAllChatsLoading());
    Constants constants = Modular.get<Constants>();
    FirebaseFirestore.instance.collection('users').doc(constants.user!.uid).collection('frinds').get().then((value) {
      chats = value.docs.map<MainChatModel>((e) => MainChatModel.fromJson(e.id, e.data())).toList();
      emit(GetAllChatsSuccess());
    }).catchError((e) {
      emit(GetAllChatsError(e.toString()));
    });
  }

  Future<void> sendMessage({
    required MessageModel message,
    required DocumentReference ref,
  }) async {
    emit(SendMessageLoading());
    await ref.collection(Modular.get<Constants>().messageCollection).add(message.toJson()).catchError((e) {
      emit(SendMessageError(e.toString()));
    });
    emit(SendMessageSuccess());
  }
}
