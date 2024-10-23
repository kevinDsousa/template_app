import 'package:diamond_blank_app/core/use_cases/login_with_apple_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/login_with_email_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/login_with_google_usecase.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final LoginWithEmailUseCase _loginWithEmailUsecase;
  final LoginWithAppleUseCase _loginWithAppleUsecase;
  final LoginWithGoogleUseCase _loginWithGoogleUsecase;

  LoginController(
    this._loginWithEmailUsecase,
    this._loginWithAppleUsecase,
    this._loginWithGoogleUsecase,
  );

  void loginWithEmail(String email, String password) {
    _loginWithEmailUsecase.execute(email, password);
  }

  void loginWithApple() {
    _loginWithAppleUsecase.execute();
  }

  void loginWithGoogle() {
    _loginWithGoogleUsecase.execute();
  }
}
