import 'package:diamond_blank_app/app/infra/datasources/http/http_client_datasource.dart';
import 'package:diamond_blank_app/app/infra/datasources/http/refresh_token_interceptor.dart';
import 'package:diamond_blank_app/app/infra/datasources/local_storage/shared_preferences_datasource.dart';
import 'package:diamond_blank_app/app/infra/repositories/auth_repository_impl.dart';
import 'package:diamond_blank_app/app/infra/repositories/firebase_auth_repository_impl.dart';
import 'package:diamond_blank_app/app/infra/repositories/jwt_repository_impl.dart';
import 'package:diamond_blank_app/app/shared/configs/logger_config.dart';
import 'package:diamond_blank_app/core/repositories/auth_repository.dart';
import 'package:diamond_blank_app/core/repositories/firebase_auth_repository.dart';
import 'package:diamond_blank_app/core/repositories/jwt_repository.dart';
import 'package:diamond_blank_app/core/use_cases/check_login_status_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/login_with_apple_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/login_with_email_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/login_with_google_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/recovery_password_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/register_with_apple_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/register_with_email_usecase.dart.dart';
import 'package:diamond_blank_app/core/use_cases/register_with_google_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(FirebaseAuth.instance);
    i.addInstance(Logger(printer: LoggerConfig.printer()));

    i.addLazySingleton(HttpClient.new);
    i.addLazySingleton(RefreshTokenInterceptor.new);
    i.addLazySingleton(SharedLocalStorageDatasource.new);

    i.addLazySingleton<JwtRepository>(JwtRepositoryImpl.new);
    i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.addLazySingleton<FirebaseAuthRepository>(FirebaseAuthRepositoryImpl.new);

    i.addLazySingleton(LoginWithAppleUseCase.new);
    i.addLazySingleton(LoginWithEmailUseCase.new);
    i.addLazySingleton(LoginWithGoogleUseCase.new);
    i.addLazySingleton(RecoveryPasswordUseCase.new);
    i.addLazySingleton(RegisterWithAppleUseCase.new);
    i.addLazySingleton(RegisterWithEmailUseCase.new);
    i.addLazySingleton(RegisterWithGoogleUseCase.new);
    i.addLazySingleton(CheckLoginStatusUseCase.new);
  }
}
