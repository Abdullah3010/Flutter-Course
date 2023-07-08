import 'package:chat_app/moduls/chat/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.message});

  final MessageModel message;
  var format = DateFormat.yMd('en');
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10.w,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      margin: EdgeInsets.only(
        bottom: 10.h,
        left: message.isMe! ? 150.w : 10.w,
        right: message.isMe! ? 10.w : 150.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: message.isMe! ? Colors.grey[300] : Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: message.isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: TextStyle(
              color: message.isMe! ? Colors.black : Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            child: Text(
              format.format(message.date.toDate()),
              maxLines: 1,
              style: TextStyle(
                color: message.isMe! ? Colors.black : Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
