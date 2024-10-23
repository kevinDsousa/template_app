import 'package:diamond_blank_app/app/presenter/initial/splash/splash_controller.dart';
import 'package:diamond_blank_app/app/presenter/initial/splash/splash_page.dart';
import 'package:diamond_blank_app/core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InitialModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.add(SplashController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (ctx) => SplashPage(
        controller: Modular.get<SplashController>(),
      ),
    );
  }
}
