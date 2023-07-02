part of 'add_frind_cubit.dart';

@immutable
abstract class AddFrindState {}

class AddFrindInitial extends AddFrindState {}

class GetAllUseresLoading extends AddFrindState {}

class GetAllUseresSuccess extends AddFrindState {}

class GetAllUseresError extends AddFrindState {
  final String error;
  GetAllUseresError(this.error);
}

class AddFrindLoading extends AddFrindState {}

class AddFrindSuccess extends AddFrindState {}

class AddFrindError extends AddFrindState {
  final String error;
  AddFrindError(this.error);
}
