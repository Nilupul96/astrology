import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/network/net_result.dart';

abstract class AuthRepository {
  Future<Result> signInWithGoogle();
  Stream<User?> authStateChanges();
  Future<Result> fetchUserProfile(String userId);
}
