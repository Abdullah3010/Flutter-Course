import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/models/task_model.dart';
import 'package:todo_app/modules/statemangment/bloc/task_bloc.dart';

class AddTask extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isUpdate;
  TaskModel? task;
  AddTask({
    this.isUpdate = false,
    this.task,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    nameController.text = task?.name ?? '';
    descriptionController.text = task?.description ?? '';
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        print("state =========> $state");
        final bloc = BlocProvider.of<TaskBloc>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(isUpdate ? 'Update task' : 'Add task'),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter task name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            labelText: 'description',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter task description';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (isUpdate) ...{
                          Row(
                            children: [
                              Checkbox(
                                value: task?.isDone ?? false,
                                onChanged: (value) {
                                  task?.isDone = value!;
                                  bloc.add(UpdateIsDoneEvent(isDone: value!));
                                },
                              ),
                              const Text('is done'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        },
                        ElevatedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              final newTask = TaskModel(
                                id: isUpdate ? task?.id : null,
                                name: nameController.text,
                                description: descriptionController.text,
                                isDone: task?.isDone ?? false,
                              );
                              if (isUpdate) {
                                bloc.add(UpdateTaskEvent(task: newTask));
                              } else {
                                bloc.add(AddTaskEvent(task: newTask));
                              }
                              Navigator.pop(context);
                            }
                          },
                          child: Text(isUpdate ? 'Update' : 'submit'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
