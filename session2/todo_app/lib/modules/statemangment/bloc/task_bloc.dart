import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/core/database/database_connection.dart';
import 'package:todo_app/modules/models/task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<TaskModel>? tasks;
  List<TaskModel>? doneTasks;
  List<TaskModel>? notDoneTasks;

  int currentBottomNavBarIndex = 0;

  TaskBloc() : super(TaskInitial()) {
    on<TaskEvent>(
      (event, emit) async {
        if (event is GetAllTasksEvent) {
          emit(GetAllTasksLoading());
          await DatabaseConnection.connect();
          tasks = await DatabaseConnection.getAllTasks();
          await DatabaseConnection.close();
          emit(GetAllTasksDone());
        } else if (event is AddTaskEvent) {
          emit(AddTasksLoading());
          await DatabaseConnection.connect();
          await DatabaseConnection.insertToTasks(event.task);
          tasks = await DatabaseConnection.getAllTasks();
          await DatabaseConnection.close();
          emit(AddTasksDone());
        } else if (event is DeleteTaskEvent) {
          emit(DeleteTaskLoading());
          await DatabaseConnection.connect();
          await DatabaseConnection.deleteTask(event.id);
          tasks!.removeWhere((element) => element.id == event.id);
          await DatabaseConnection.close();
          emit(DeleteTaskDone());
        } else if (event is UpdateTaskEvent) {
          emit(UpdateTaskLoading());
          await DatabaseConnection.connect();
          await DatabaseConnection.updateTask(event.task);
          tasks = await DatabaseConnection.getAllTasks();
          await DatabaseConnection.close();
          emit(UpdateTaskDone());
        } else if (event is UpdateIsDoneEvent) {
          emit(UpdateIsDoneState(isDone: event.isDone));
        } else if (event is BottomNavBarChangeEvent) {
          currentBottomNavBarIndex = event.index;
          emit(BottomNavBarChangeState(index: event.index));
        }
        tasks!.forEach((element) {
          if (element.isDone)
            doneTasks!.add(element);
          else
            notDoneTasks!.add(element);
        });
      },
    );
  }
}
