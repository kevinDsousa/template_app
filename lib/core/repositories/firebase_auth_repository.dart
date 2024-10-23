abstract class FirebaseAuthRepository {
  Future<String?> getToken();

  Future<String?> loginWithApple();
  Future<String?> loginWithGoogle();
  Future<String?> loginWithEmailAndPassword(String email, String password);

  Future<void> registerWithEmailAndPassword(String email, String password);
  Future<void> recoverPassword(String email);
  Future<void> logout();
}
