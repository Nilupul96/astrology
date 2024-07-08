import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net_result.dart';

abstract class SettingService {
  Future<Result> signOut();
}

class SettingServiceImpl implements SettingService {
  @override
  Future<Result> signOut() async {
    Result result = Result();
    try {
      await FirebaseAuth.instance.signOut();
      await handleGoogleSignOut();
      result.result = true;
    } catch (error) {
      Log.err("sign out err $error");
      result.exception = NetException(
          message: '$error',
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
    }
    return result;
  }

  Future<void> handleGoogleSignOut() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'profile',
        'openid',
      ],
    );
    bool isGoogleLogged = await googleSignIn.isSignedIn();
    if (isGoogleLogged) {
      googleSignIn.disconnect().whenComplete(() {
        Log.debug("google logged out");
      });
    }
  }
}
