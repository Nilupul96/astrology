import '../../../../core/network/net_result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class FetchUserProfileUseCase implements UseCase<Result, String> {
  final AuthRepository _authRepository;

  FetchUserProfileUseCase(this._authRepository);

  @override
  Future<Result> call({String? params}) {
    return _authRepository.fetchUserProfile(params!);
  }
}
