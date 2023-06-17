import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/utils/constanct.dart';
import 'package:chat_app/moduls/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  XFile? image;
  bool isRegisterPassword = true;

  void pikeUserImage(ImageSource source) async {
    emit(PickImageLoading());
    ImagePicker piker = ImagePicker();
    image = await piker.pickImage(source: source);
    emit(PickImageSuccess());
  }

  void changePasswordVisibleRegister() {
    isRegisterPassword = !isRegisterPassword;
    emit(ChangePasswordObscureText());
  }

  void register({required UserModel user}) async {
    emit(RegisterLoading());
    final auth = Modular.get<FirebaseAuth>();
    auth
        .createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    )
        .then((value) async {
      final String userId = value.user?.uid ?? '';
      final imagUrl = await uplodUserImage(userId);
      user.image = imagUrl;
      user.uid = userId;
      saveUserData(user);
      emit(RegisterSuccess());
    }).catchError(
      (error) {
        // if (error.code == 'weak-password') {
        //   emit(RegisterError(error: error.message));
        // } else if (error.code == 'email-already-in-use') {
        //   emit(RegisterError(error: error.message));
        // } else {
        emit(RegisterError(error: error.message));
        // }
      },
    );
  }

  Future<String> uplodUserImage(String userId) async {
    String? imageUrl;
    if (image != null) {
      final ref = FirebaseStorage.instance.ref('$userId/profileImage').child('$userId.jpg');
      final uploadedImage = await ref.putFile(
        File(image!.path),
      );
      imageUrl = await uploadedImage.ref.getDownloadURL();
    }
    return imageUrl ?? '';
  }

  void saveUserData(UserModel user) async {
    final storage = FirebaseFirestore.instance;
    await storage.collection('users').doc(user.uid).set(user.toJson());
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final auth = Modular.get<FirebaseAuth>();
    auth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
      await getUserData(value.user?.uid ?? '');
      emit(LoginSuccess());
    }).catchError((error) {
      emit(LoginError(error: error.message));
    });
  }

  Future<void> getUserData(String userId) async {
    final constant = Modular.get<Constants>();
    final storage = FirebaseFirestore.instance;
    final snapshot = await storage.collection('users').doc(userId).get();
    constant.user = UserModel.fromJson(snapshot.data() ?? {});
  }
}
