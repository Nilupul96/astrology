import 'package:astrology/core/network/net_result.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(AuthService authService) : _authService = authService;

  @override
  Future<Result> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  @override
  Stream<User?> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges();
  }

  @override
  Future<Result> fetchUserProfile(String userId) async {
    return await _authService.fetchUserProfile(userId);
  }
}
