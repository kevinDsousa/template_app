import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class RegisterWithEmailUseCase {
  final FirebaseAuthRepository _authRepository;

  RegisterWithEmailUseCase(this._authRepository);

  Future<void> execute(String email, String password) async {
    await _authRepository.registerWithEmailAndPassword(email, password);
  }
}
