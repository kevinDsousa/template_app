import 'package:diamond_blank_app/core/repositories/auth_repository.dart';
import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';
import 'package:diamond_blank_app/core/repositories/jwt_repository.dart';
import 'package:flutter/cupertino.dart';

class CheckLoginStatusUseCase {
  final JwtRepository _jwtRepository;
  final AuthRepository _authRepository;
  final FirebaseAuthRepository _firebaseAuthRepository;

  CheckLoginStatusUseCase(
    this._jwtRepository,
    this._authRepository,
    this._firebaseAuthRepository,
  );

  Future<bool> execute() async {
    var userIsLogged = await _jwtRepository.isLogged();

    if (userIsLogged) {
      return true;
    }

    var refreshToken = await _firebaseAuthRepository.getToken();

    if (refreshToken == null) {
      return false;
    }

    try {
      final jwt = await _authRepository.refreshToken(refreshToken);
      _jwtRepository.setJWT(jwt);
      return true;
    } on FlutterError catch (_) {
      return false;
    }
  }
}
