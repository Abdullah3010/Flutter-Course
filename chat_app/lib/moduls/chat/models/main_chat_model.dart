import 'package:cloud_firestore/cloud_firestore.dart';

class MainChatModel {
  final DocumentReference chatId;
  final String name;
  final String uid;
  String? image;
  final String lastMessage;

  MainChatModel({
    required this.chatId,
    required this.name,
    required this.uid,
    required this.lastMessage,
    this.image,
  });

  factory MainChatModel.fromJson(String uid, Map<String, dynamic> json) {
    return MainChatModel(
      uid: uid,
      chatId: json['chatId'],
      name: json['name'],
      lastMessage: json['lastMessage'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'name': name,
      'lastMessage': lastMessage,
      'image': image,
    };
  }
}
