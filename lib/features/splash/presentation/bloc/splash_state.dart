part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashError extends SplashState {
  final NetException netException;

  const SplashError({required this.netException});
}

class SplashSusses extends SplashState {
  final User? user;

  const SplashSusses({this.user});
}
