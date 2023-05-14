import 'package:flutter/material.dart';
import 'package:todo_app/core/database/database_connection.dart';
import 'package:todo_app/modules/models/task_model.dart';
import 'package:todo_app/modules/views/add_task.dart';
import 'package:todo_app/modules/widgets/task_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<TaskModel> tasks = [];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  void initDatabase() async {
    await DatabaseConnection.connect();
    tasks = await DatabaseConnection.getAllTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return TaskWidget(
            task: tasks[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTask(),
            ),
          ).then((value) async {
            tasks = await DatabaseConnection.getAllTasks();
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ds',
          ),
        ],
      ),
    );
  }
}
