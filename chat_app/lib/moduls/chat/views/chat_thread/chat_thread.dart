import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/moduls/chat/models/main_chat_model.dart';
import 'package:chat_app/moduls/chat/models/message_model.dart';
import 'package:chat_app/moduls/chat/statemangment/cubit/chat_cubit.dart';
import 'package:chat_app/moduls/chat/views/chat_thread/widget/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatThreadScreen extends StatelessWidget {
  ChatThreadScreen({
    super.key,
    required this.user,
  });

  final MainChatModel user;
  final Constants constants = Modular.get<Constants>();
  final TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: StreamBuilder(
        stream: user.chatId
            .collection(constants.messageCollection)
            .orderBy(
              'date',
              descending: true,
            )
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: Text('No Messages'),
            );
          }
          final List<MessageModel> messages =
              snapshot.data!.docs.map<MessageModel>((e) => MessageModel.fromJson(e.id, e.data())).toList();
          return ListView.builder(
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return MessageWidget(
                message: messages[index],
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 20.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
              onPressed: () {
                BlocProvider.of<ChatCubit>(context).sendMessage(
                  message: MessageModel(
                    text: messageController.text,
                    date: Timestamp.now(),
                    fromUid: constants.user!.uid!,
                    toUid: user.uid,
                  ),
                  ref: user.chatId,
                );
                messageController.clear();
              },
              icon: Icon(
                Icons.send,
                size: 30.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
