import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class LoginWithAppleUseCase {
  final FirebaseAuthRepository _authRepository;

  LoginWithAppleUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.loginWithApple();
  }
}
