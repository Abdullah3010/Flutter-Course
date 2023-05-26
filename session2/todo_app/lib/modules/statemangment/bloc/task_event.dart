part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class GetAllTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final TaskModel task;

  const AddTaskEvent({
    required this.task,
  });
}

class DeleteTaskEvent extends TaskEvent {
  final int id;

  const DeleteTaskEvent({
    required this.id,
  });
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;

  const UpdateTaskEvent({
    required this.task,
  });
}

class UpdateIsDoneEvent extends TaskEvent {
  final bool isDone;

  const UpdateIsDoneEvent({
    required this.isDone,
  });
}

class BottomNavBarChangeEvent extends TaskEvent {
  final int index;

  const BottomNavBarChangeEvent({
    required this.index,
  });
}
