import 'package:diamond_blank_app/core/repositories/jwt_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class RefreshTokenInterceptor extends Interceptor {
  final JwtRepository _jwtRepository;
  final Logger _logger;

  RefreshTokenInterceptor(this._jwtRepository, this._logger);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await _jwtRepository.isLogged()) {
      var jwt = await _jwtRepository.getJWT();
      options.headers['Authorization'] = 'Bearer $jwt';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final statusCode = response.statusCode;
    final path = response.requestOptions.path;
    debugPrint('RESPONSE[$statusCode] => PATH: $path');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;
    _logger.e('ERROR[$statusCode] => PATH: $path', error: err);
    super.onError(err, handler);
  }
}
