import 'package:astrology/features/login/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net_result.dart';

abstract class LoginService {
  Future<Result> signInWithGoogle();
}

class LoginServiceImpl implements LoginService {
  
  @override
  Future<Result> signInWithGoogle() async {
    Result result = Result();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
          'profile',
          'openid',
        ],
      ).signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final auth.UserCredential userData =
          await auth.FirebaseAuth.instance.signInWithCredential(credential);
      User user =
          User(email: userData.user!.email!, userId: userData.user!.uid);
      await createUserAccount(user);
      result.result = user;
      return result;
    } catch (error) {
      Log.err("google  err $error");
      result.exception = NetException(
          message: '$error',
          messageId: CommonMessageId.LOGIN_ERROR,
          code: ExceptionCode.CODE_000);
      return result;
    }
  }

  Future<void> createUserAccount(User user) async {}

  
}
