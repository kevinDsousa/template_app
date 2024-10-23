import 'package:diamond_blank_app/app/infra/datasources/http/http_client_datasource.dart';
import 'package:diamond_blank_app/app/shared/constants/api.dart';
import 'package:diamond_blank_app/core/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthRepositoryImpl implements AuthRepository {
  final HttpClient _client;
  final Logger _logger;

  late Dio _clientWithoutAuth;

  AuthRepositoryImpl(this._client, this._logger) {
    _clientWithoutAuth = Dio();
    _clientWithoutAuth.options.headers['Content-Type'] = 'application/json';
    _clientWithoutAuth.options.headers.remove('Authorization');
  }

  @override
  Future<String> refreshToken(String token) async {
    try {
      Response response = await _clientWithoutAuth.post(
        '${api}auth/refresh-token',
        data: {"token": refreshToken},
      );

      if (response.statusCode == 200) {
        var jwt = response.data['token'];
        _logger.i('Token JWT atualizado com sucesso!');
        return jwt;
      }
    } on DioException catch (e) {
      _logger.e('Erro ao tentar atualizar o token JWT.', error: e);
    }

    throw FlutterError('Falha ao atualizar o token JWT!');
  }

  @override
  Future<String> loginWithToken(String token) async {
    String url = '${api}auth/login/firebase-token';

    try {
      Response response = await _client.post(url, data: {"token": token});
      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    throw FlutterError('Falha ao realizar o login!');
  }

  @override
  Future<String> registerWithToken(String token) async {
    String url = '${api}auth/register/firebase-token';

    try {
      Response response = await _client.post(url, data: {"token": token});
      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    throw FlutterError('Falha ao realizar cadastro!');
  }

  @override
  Future<String> registerWithCredentials(String email, String password) async {
    String url = '${api}auth/register-with-credentials';

    try {
      Response response = await _client.post(url, queryParameters: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioException catch (e) {
      if (e.response != null && [400, 500].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    throw FlutterError('Falha ao realizar cadastro!');
  }
}
