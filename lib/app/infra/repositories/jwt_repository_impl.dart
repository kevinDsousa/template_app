import 'package:diamond_blank_app/app/infra/datasources/local_storage/shared_preferences_datasource.dart';
import 'package:diamond_blank_app/core/repositories/jwt_repository.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:logger/logger.dart';

class JwtRepositoryImpl implements JwtRepository {
  final Logger _logger;
  final SharedLocalStorageDatasource _sharedLocalStorage;

  JwtRepositoryImpl(
    this._logger,
    this._sharedLocalStorage,
  );

  @override
  Future<void> setJWT(String jwt) async {
    await _sharedLocalStorage.put('jwt', jwt);
  }

  @override
  Future<String> getJWT() async {
    return await _sharedLocalStorage.get('jwt') ?? '';
  }

  @override
  Future<Map<String, dynamic>> getPayload() async {
    var jwt = await getJWT();

    if (jwt.isNotEmpty) {
      try {
        return JwtDecoder.decode(jwt);
      } on FormatException catch (e) {
        _logger.e('Erro ao realizar o decode do token JWT.', error: e);
      }
    }
    throw FlutterError('Falha ao realizar o decode do token JWT.');
  }

  @override
  Future<String> getLoggedUserEmail() async {
    var payload = await getPayload();
    return payload['sub'];
  }

  @override
  Future<String> getLoggedUserId() async {
    var payload = await getPayload();
    return payload['user_id'];
  }

  @override
  Future<String> getLoggedUserRole() async {
    var payload = await getPayload();
    return payload['scope'];
  }

  @override
  Future<void> logout() async {
    await _sharedLocalStorage.delete('jwt');
  }

  @override
  Future<bool> isLogged() async {
    var jwt = await getJWT();
    if (jwt.isEmpty) return false;
    return JwtDecoder.isExpired(jwt);
  }
}
