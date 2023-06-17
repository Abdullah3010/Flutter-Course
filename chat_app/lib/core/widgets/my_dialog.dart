import 'package:flutter/material.dart';

class MySimpleDialog extends StatelessWidget {
  const MySimpleDialog({
    super.key,
    required this.title,
    required this.content,
    this.actions,
  });

  final String title;
  final String content;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: actions,
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
