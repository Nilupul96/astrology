part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginInSuccess extends LoginState {
  final User user;

  const LoginInSuccess({required this.user});
}

class LogInError extends LoginState {
  final NetException exception;

  const LogInError({required this.exception});
}
