part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserData user;

  const AuthSuccess({required this.user});
}

class AuthStateSuccess extends AuthState {
  final User user;
  const AuthStateSuccess({required this.user});
}

class AuthStateError extends AuthState {}

class AuthError extends AuthState {
  final NetException exception;

  const AuthError({required this.exception});
}
