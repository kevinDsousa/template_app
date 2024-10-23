import 'package:diamond_blank_app/app/shared/constants/durations.dart';
import 'package:diamond_blank_app/core/use_cases/check_login_status_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  final CheckLoginStatusUseCase _checkLoginStatus;

  SplashController(this._checkLoginStatus) {
    waitAndNavigate();
  }

  waitAndNavigate() async {
    var result = await _checkLoginStatus.execute();

    Future.delayed(
      splashDuration,
      () => _redirectToRightPage(result),
    );
  }

  _redirectToRightPage(bool result) {
    if (result) {
      Modular.to.navigate('/home/page1/');
    } else {
      Modular.to.navigate('/auth/');
    }
  }
}
