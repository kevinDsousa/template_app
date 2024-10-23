import 'package:diamond_blank_app/core/use_cases/recovery_password_usecase.dart';
import 'package:flutter/material.dart';

class RecoveryPasswordController extends ChangeNotifier {
  final RecoveryPasswordUseCase _recoveryPasswordUsecase;

  RecoveryPasswordController(this._recoveryPasswordUsecase);

  void recoveryPassword(String email) {
    _recoveryPasswordUsecase.execute(email);
  }
}
