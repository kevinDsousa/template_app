import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class LoginWithGoogleUseCase {
  final FirebaseAuthRepository _authRepository;

  LoginWithGoogleUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.loginWithGoogle();
  }
}
