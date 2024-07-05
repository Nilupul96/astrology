import 'package:astrology/core/network/net_exception.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/network/net_result.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/sign_in_with_google.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  LoginBloc(this._signInWithGoogleUseCase) : super(LoginInitial()) {
    on<SignInWithGoogle>(onSignInWithGoogle);
  }

  void onSignInWithGoogle(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    Result result = await _signInWithGoogleUseCase();
    if (result.exception != null) {
      emit(LogInError(exception: result.exception!));
    }
    if (result.exception == null) {
      emit(LoginInSuccess(user: result.result));
    }
  }
}
