import 'package:diamond_blank_app/app/presenter/auth/login/login_controller.dart';
import 'package:diamond_blank_app/app/presenter/auth/login/login_page.dart';
import 'package:diamond_blank_app/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.add(LoginController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (ctx) => LoginPage(
        controller: Modular.get<LoginController>(),
      ),
    );
  }
}
