import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<String?> getToken() async {
    return _firebaseAuth.currentUser?.getIdToken();
  }

  @override
  Future<String?> loginWithApple() async {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<String?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return await _firebaseAuth.currentUser?.getIdToken();
    } catch (e) {
      throw FlutterError('Falha ao realizar login com google!');
    }
  }

  @override
  Future<String?> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return await _firebaseAuth.currentUser!.getIdToken();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw FlutterError('Email não encontrado na base de dados!');
        case 'wrong-password':
          throw FlutterError('Senha incorreta!');
        default:
          throw FlutterError('Falha ao realizar login com email!');
      }
    }
  }

  @override
  Future<void> recoverPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw FlutterError('Email inválido!');
        case 'user-not-found':
          throw FlutterError('Email não encontrado na base de dados!');
        default:
          throw FlutterError(
            'Falha ao tentar enviar email para recuperação de senha!',
          );
      }
    }
  }

  @override
  Future<void> registerWithEmailAndPassword(String email, String password) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
