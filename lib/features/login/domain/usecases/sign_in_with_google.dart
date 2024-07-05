import 'package:astrology/features/login/domain/repositories/login_repository.dart';
import '../../../../core/network/net_result.dart';
import '../../../../core/usecase/usecase.dart';

class SignInWithGoogleUseCase implements UseCase<Result, void> {
  final LoginRepository _loginRepository;

  SignInWithGoogleUseCase(this._loginRepository);

  @override
  Future<Result> call({void params}) {
    return _loginRepository.signInWithGoogle();
  }
}
