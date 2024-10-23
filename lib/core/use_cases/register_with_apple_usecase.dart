import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class RegisterWithAppleUseCase {
  final FirebaseAuthRepository _authRepository;

  RegisterWithAppleUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.loginWithApple();
  }
}
