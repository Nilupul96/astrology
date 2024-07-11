part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogle extends AuthEvent {}

class ListenAuthStateChanges extends AuthEvent {}

class FetchUserProfile extends AuthEvent {
  final String userId;

  const FetchUserProfile(this.userId);
}
