part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskInitial extends TaskState {}

class GetAllTasksLoading extends TaskState {}

class GetAllTasksDone extends TaskState {}

class AddTasksLoading extends TaskState {}

class AddTasksDone extends TaskState {}

class DeleteTaskLoading extends TaskState {}

class DeleteTaskDone extends TaskState {}

class UpdateTaskLoading extends TaskState {}

class UpdateTaskDone extends TaskState {}

class UpdateIsDoneState extends TaskState {
  bool isDone;

  UpdateIsDoneState({
    required this.isDone,
  });

  @override
  List<Object> get props => [isDone];
}

class BottomNavBarChangeState extends TaskState {
  final int index;

  const BottomNavBarChangeState({required this.index});

  @override
  List<Object> get props => [index];
}
