import 'package:chat_app/moduls/chat/models/main_chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainChatWidget extends StatelessWidget {
  const MainChatWidget({
    super.key,
    required this.user,
  });

  final MainChatModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey[300],
      ),
      child: Row(
        children: [
          user.image!.isEmpty
              ? const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                )
              : CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage(user.image ?? ''),
                ),
          const SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.lastMessage,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
