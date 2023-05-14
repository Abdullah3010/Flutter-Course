import 'package:flutter/material.dart';
import 'package:todo_app/core/database/database_connection.dart';
import 'package:todo_app/modules/models/task_model.dart';

class AddTask extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add task'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter task name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter task description';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        final task = TaskModel(
                          name: nameController.text,
                          description: descriptionController.text,
                          isDone: false,
                        );
                        await DatabaseConnection.insertToTasks(task);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('submit'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
