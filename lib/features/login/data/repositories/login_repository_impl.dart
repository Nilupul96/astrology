import 'package:astrology/core/network/net_result.dart';
import 'package:astrology/features/login/data/datasources/login_service.dart';
import 'package:astrology/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService _loginService;

  LoginRepositoryImpl(LoginService loginService)
      : _loginService = loginService;

  @override
  Future<Result> signInWithGoogle() async {
    return await _loginService.signInWithGoogle();
  }
}
