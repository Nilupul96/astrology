import 'package:astrology/core/network/net_exception.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/net_result.dart';
import '../../domain/usecases/check_use_state_usecase.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckUserAuthStateUseCase _checkUserAuthStateUseCase;
  SplashBloc(this._checkUserAuthStateUseCase) : super(SplashInitial()) {
    on<CheckUserAuthStateEvent>(checkUserAuthState);
  }

  Future<void> checkUserAuthState(
      SplashEvent event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    Result result = await _checkUserAuthStateUseCase.call();
    if (result.exception != null) {
      emit(SplashError(netException: result.exception!));
    }
    emit(SplashSusses(user: result.result));
  }
}
