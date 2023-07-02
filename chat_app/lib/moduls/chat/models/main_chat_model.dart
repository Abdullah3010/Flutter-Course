import 'package:cloud_firestore/cloud_firestore.dart';

class MainChatModel {
  final DocumentReference chatId;
  final String name;
  String? image;
  final String lastMessage;

  MainChatModel({
    required this.chatId,
    required this.name,
    required this.lastMessage,
    this.image,
  });

  factory MainChatModel.fromJson(Map<String, dynamic> json) {
    return MainChatModel(
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
