import '../../../../core/network/net_result.dart';

abstract class SplashRepository {
  Future<Result> checkCurrentUserAuthState();
}
