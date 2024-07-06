import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_result.dart';

abstract class SplashService {
  Future<Result> checkCurrentUserAuthState();
}

class SplashServiceImpl implements SplashService {
  @override
  Future<Result> checkCurrentUserAuthState() async {
    Result result = Result();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Log.debug("User already logged in - ${user.uid}  ${user.displayName}");
        result.result = user;
      }
      Log.debug("user log out");
    });
    return result;
  }
}
