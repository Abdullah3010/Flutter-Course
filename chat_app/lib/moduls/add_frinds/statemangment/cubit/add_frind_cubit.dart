import 'package:bloc/bloc.dart';
import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/moduls/add_frinds/models/add_frind_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

part 'add_frind_state.dart';

class AddFrindCubit extends Cubit<AddFrindState> {
  AddFrindCubit() : super(AddFrindInitial());

  List<AddFrindModel>? users;

  void getAllUsers() {
    emit(GetAllUseresLoading());
    FirebaseFirestore.instance.collection('users').get().then((value) {
      users = value.docs.map<AddFrindModel>((e) {
        return AddFrindModel.fromJson(e.data());
      }).toList();
      emit(GetAllUseresSuccess());
    }).catchError((e) {
      emit(GetAllUseresError(e.toString()));
    });
  }

  void addFrind(AddFrindModel frind) {
    emit(AddFrindLoading());
    final Constants currentUser = Modular.get<Constants>();
    final String chatId = '${currentUser.user?.uid}-${frind.uId}';
    final firestore = FirebaseFirestore.instance;
    firestore.collection('chats').doc(chatId).set({
      'chatId': chatId,
    }).then((value) {
      firestore.collection('users').doc(currentUser.user?.uid).collection('frinds').doc(frind.uId).set({
        'name': frind.name,
        'image': frind.image,
        'lastMessage': '',
        'chatId': firestore.collection('chats').doc(chatId),
      }).then((value) {
        firestore.collection('users').doc(frind.uId).collection('frinds').doc(currentUser.user?.uid).set({
          'name': currentUser.user?.name,
          'image': currentUser.user?.image,
          'lastMessage': '',
          'chatId': firestore.collection('chats').doc(chatId),
        }).then((value) => emit(AddFrindSuccess()));
      });
    }).catchError((e) {
      emit(AddFrindError(e.toString()));
    });
  }
}
