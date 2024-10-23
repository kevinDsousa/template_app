abstract class JwtRepository {
  Future<void> setJWT(String jwt);
  Future<String> getJWT();
  Future<Map<String, dynamic>> getPayload();
  Future<String> getLoggedUserEmail();
  Future<String> getLoggedUserId();
  Future<String> getLoggedUserRole();
  Future<bool> isLogged();
  Future<void> logout();
}
