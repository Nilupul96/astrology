import '../../../../core/network/net_result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class SignInWithGoogleUseCase implements UseCase<Result, void> {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  @override
  Future<Result> call({void params}) {
    return _authRepository.signInWithGoogle();
  }
}
