import 'package:diamond_blank_app/core/use_cases/register_with_apple_usecase.dart';
import 'package:diamond_blank_app/core/use_cases/register_with_email_usecase.dart.dart';
import 'package:diamond_blank_app/core/use_cases/register_with_google_usecase.dart';
import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final RegisterWithEmailUseCase _registerWithEmailUsecase;
  final RegisterWithAppleUseCase _registerWithAppleUsecase;
  final RegisterWithGoogleUseCase _registerWithGoogleUsecase;

  RegisterController(
    this._registerWithEmailUsecase,
    this._registerWithAppleUsecase,
    this._registerWithGoogleUsecase,
  );

  void registerWithEmail(String email, String password) {
    _registerWithEmailUsecase.execute(email, password);
  }

  void registerWithApple() {
    _registerWithAppleUsecase.execute();
  }

  void registerWithGoogle() {
    _registerWithGoogleUsecase.execute();
  }
}
