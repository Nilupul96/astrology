import 'package:astrology/features/settings/domain/usecases/signout_usecaase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/network/net_result.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SignOutUseCase _signOutUseCase;
  SettingsBloc(this._signOutUseCase) : super(SettingsInitial()) {
    on<SignOutEvent>(signOut);
  }

  void signOut(SettingsEvent event, Emitter<SettingsState> emit) async {
    emit(SignOutLoading());
    Result result = await _signOutUseCase.call();
    if (result.exception != null) {
      emit(SignOutError(error: result.exception!.message!));
      return;
    }
    emit(SignOutSuccess());
  }
}
