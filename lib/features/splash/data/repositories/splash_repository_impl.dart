import 'package:astrology/features/splash/data/datasources/splash_service.dart';
import 'package:astrology/features/splash/domain/repositories/splash_repository.dart';

import '../../../../core/network/net_result.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashService _splashService;

  SplashRepositoryImpl(SplashService splashService)
      : _splashService = splashService;

  @override
  Future<Result> checkCurrentUserAuthState() async {
    return await _splashService.checkCurrentUserAuthState();
  }
}
