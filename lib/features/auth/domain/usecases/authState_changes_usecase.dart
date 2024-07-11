import 'package:astrology/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/usecase/usecase.dart';

class AuthStateChangesUseCase implements UseCase<Stream<User?>, void> {
  final AuthRepository _authRepository;

  AuthStateChangesUseCase(this._authRepository);
  @override
  Future<Stream<User?>> call({void params}) async {
    return _authRepository.authStateChanges();
  }
}
