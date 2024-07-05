import '../../../../core/network/net_result.dart';

abstract class LoginRepository {
  Future<Result> signInWithGoogle();
}
