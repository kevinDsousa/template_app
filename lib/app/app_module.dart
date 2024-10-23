import 'package:diamond_blank_app/app/presenter/auth/auth_module.dart';
import 'package:diamond_blank_app/app/presenter/initial/home/home_controller.dart';
import 'package:diamond_blank_app/app/presenter/initial/home/home_page.dart';
import 'package:diamond_blank_app/app/presenter/initial/initial_module.dart';
import 'package:diamond_blank_app/app/presenter/page1/page1_module.dart';
import 'package:diamond_blank_app/app/presenter/page2/page2_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.add(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: InitialModule(),
    );
    r.module(
      '/auth',
      module: AuthModule(),
    );
    r.child(
      '/home',
      child: (ctx) => HomePage(
        controller: Modular.get<HomeController>(),
      ),
      children: [
        ModuleRoute(
          '/page1',
          module: Page1Module(),
        ),
        ModuleRoute(
          '/page2',
          module: Page2Module(),
        ),
      ],
    );
  }
}
