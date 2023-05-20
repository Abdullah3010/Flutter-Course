import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/statemangment/bloc/task_bloc.dart';
import 'package:todo_app/modules/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<TaskBloc>(context);
        return state is GetAllTasksLoading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: bloc.tasks?.length ?? 0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return TaskWidget(
                    task: bloc.tasks![index],
                  );
                },
              );
      },
    );
  }
}
