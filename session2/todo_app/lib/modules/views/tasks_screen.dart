import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/statemangment/bloc/task_bloc.dart';
import 'package:todo_app/modules/views/add_task.dart';
import 'package:todo_app/modules/views/all_tasks_screen.dart';
import 'package:todo_app/modules/views/complete_screen.dart';
import 'package:todo_app/modules/views/uncomplete_screen.dart';
import 'package:todo_app/modules/widgets/task_widget.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    AllTasksScreen(),
    const CompleteTasksScreen(),
    const UncompleteTasksScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        print("state =========> $state");
        final bloc = BlocProvider.of<TaskBloc>(context);
        if (state is TaskInitial) {
          bloc.add(GetAllTasksEvent());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks'),
          ),
          body: screens[currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTask(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.done_all_outlined),
                label: 'completed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.delete_sweep_rounded),
                label: 'uncompleted',
              ),
            ],
          ),
        );
      },
    );
  }
}
