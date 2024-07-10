import 'package:astrology/core/network/net_exception.dart';
import 'package:astrology/features/auth/domain/usecases/authState_changes_usecase.dart';
import 'package:astrology/features/auth/domain/usecases/fetch_user_profile_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_result.dart';
import '../../data/models/user_model.dart';
import '../../domain/usecases/sign_in_with_google.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final FetchUserProfileUseCase _fetchUserProfileUseCase;
  final AuthStateChangesUseCase _authStateChangesUseCase;

  AuthBloc(this._signInWithGoogleUseCase, this._fetchUserProfileUseCase,
      this._authStateChangesUseCase)
      : super(LoginInitial()) {
    on<SignInWithGoogle>(onSignInWithGoogle);
    on<ListenAuthStateChanges>(onAuthStateChanges);
    on<FetchUserProfile>(fetchUserProfile);
  }

  void onSignInWithGoogle(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Result result = await _signInWithGoogleUseCase();
    if (result.exception != null) {
      emit(AuthError(exception: result.exception!));
    }
    if (result.exception == null) {
      emit(AuthSuccess(user: result.result));
    }
  }

  void onAuthStateChanges(AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Stream<User?> authStateStream = await _authStateChangesUseCase.call();
    await emit.forEach(authStateStream, onData: (user) {
      Log.info("user---${user?.uid}");
      if (user != null) {
        Log.debug("User authenticated");
        return AuthStateSuccess(user: user);
      } else {
        Log.debug("User sign out");
        return AuthStateError();
      }
    });
  }

  void fetchUserProfile(FetchUserProfile event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    Result result = await _fetchUserProfileUseCase.call(params: event.userId);
    if (result.exception != null) {
      emit(AuthError(exception: result.exception!));
    }
    if (result.exception == null) {
      emit(AuthSuccess(user: result.result));
    }
  }
}
