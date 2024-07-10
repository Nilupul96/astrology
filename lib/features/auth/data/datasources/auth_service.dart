import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/network/net_exception.dart';
import '../../../../core/network/net_result.dart';
import '../models/user_model.dart';

abstract class AuthService {
  Future<Result> signInWithGoogle();
  Future<Result> fetchUserProfile(String userId);
}

class AuthServiceImpl implements AuthService {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
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

      UserData? user = await createUserAccount(userData);
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

  Future<UserData?> createUserAccount(auth.UserCredential credential) async {
    try {
      if (credential.user?.uid != null) {
        DocumentSnapshot doc = await firestoreInstance
            .collection('users')
            .doc(credential.user?.uid)
            .get();
        if (!doc.exists) {
          Log.debug('New user profile created');
          await firestoreInstance
              .collection('users')
              .doc(credential.user!.uid)
              .set({
            'userId': credential.user!.uid,
            'name': credential.user!.displayName,
            'email': credential.user!.email,
            'profileCompleted': false,
            'gender': null,
            'birthDate': null,
            'birthTime': null
          });
        } else {
          Log.debug('Already have user account');
        }
        Log.info("user data --->${doc.data()}");
        if (doc.data() != null) {
          return UserData.fromJson(doc.data() as Map<String, dynamic>);
        }
        return UserData(
            email: credential.user!.email!,
            userId: credential.user!.uid,
            name: credential.user!.displayName,
            profileCompleted: null);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Result> fetchUserProfile(String userId) async {
    Result result = Result();
    try {
      DocumentSnapshot doc =
          await firestoreInstance.collection('users').doc(userId).get();
      if (doc.exists) {
        result.result = UserData.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        result.exception = NetException(
            message: 'Couldn\'t find user profile',
            messageId: CommonMessageId.SOMETHING_WENT_WRONG,
            code: ExceptionCode.CODE_000);
      }
    } catch (error) {
      Log.err("fetch user profile error $error");
      result.exception = NetException(
          message: '$error',
          messageId: CommonMessageId.SOMETHING_WENT_WRONG,
          code: ExceptionCode.CODE_000);
    }
    return result;
  }
}
