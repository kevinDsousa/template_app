import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';

class RecoveryPasswordUseCase {
  final FirebaseAuthRepository _authRepository;

  RecoveryPasswordUseCase(this._authRepository);

  Future<void> execute(String email) async {
    await _authRepository.recoverPassword(email);
  }
}
