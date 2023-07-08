import 'package:chat_app/core/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MessageModel {
  String? id;
  final String text;
  final Timestamp date;
  final String fromUid;
  final String toUid;
  bool? isMe;

  MessageModel({
    required this.text,
    required this.date,
    required this.fromUid,
    required this.toUid,
    this.id,
    this.isMe,
  });

  factory MessageModel.fromJson(String messageId, Map<String, dynamic> json) {
    final myUid = Modular.get<Constants>().user!.uid;
    return MessageModel(
      text: json['text'],
      date: json['date'],
      fromUid: json['fromUid'],
      toUid: json['toUid'],
      id: messageId,
      isMe: myUid == json['fromUid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'date': date,
      'fromUid': fromUid,
      'toUid': toUid,
    };
  }
}
