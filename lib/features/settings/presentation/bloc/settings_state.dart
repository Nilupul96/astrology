part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class SignOutLoading extends SettingsState {}

class SignOutSuccess extends SettingsState {}

class SignOutError extends SettingsState {
  final String error;
  const SignOutError({required this.error});
}
