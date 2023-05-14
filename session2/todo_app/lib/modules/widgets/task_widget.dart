import 'package:flutter/material.dart';
import 'package:todo_app/modules/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(3),
          topLeft: Radius.circular(3),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  task.description,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              print("icon pressed");
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
