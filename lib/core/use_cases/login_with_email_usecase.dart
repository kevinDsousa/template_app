import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class LoginWithEmailUseCase {
  final FirebaseAuthRepository _authRepository;

  LoginWithEmailUseCase(this._authRepository);

  Future<void> execute(String email, String password) async {
    await _authRepository.loginWithEmailAndPassword(email, password);
  }
}
