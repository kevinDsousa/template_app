abstract class AuthRepository {
  Future<String> refreshToken(String token);
  Future<String> loginWithToken(String token);
  Future<String> registerWithToken(String token);
  Future<String> registerWithCredentials(String email, String password);
}
