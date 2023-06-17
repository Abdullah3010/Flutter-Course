part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class PickImageLoading extends AuthState {}

class PickImageSuccess extends AuthState {}

class ChangePasswordObscureText extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  final String error;

  RegisterError({required this.error});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String error;

  LoginError({required this.error});
}
