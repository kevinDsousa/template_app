import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class RegisterWithGoogleUseCase {
  final FirebaseAuthRepository _authRepository;

  RegisterWithGoogleUseCase(this._authRepository);

  Future<void> execute() async {
    await _authRepository.loginWithGoogle();
  }
}
