import 'package:astrology/core/usecase/usecase.dart';
import 'package:astrology/features/splash/domain/repositories/splash_repository.dart';

class CheckUserAuthStateUseCase extends UseCase<void, void> {
  final SplashRepository _splashRepository;

  CheckUserAuthStateUseCase(SplashRepository splashRepository)
      : _splashRepository = splashRepository;
  @override
  Future call({params}) async {
    return await _splashRepository.checkCurrentUserAuthState();
  }
}
