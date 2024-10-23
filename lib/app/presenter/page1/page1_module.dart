import 'package:diamond_blank_app/app/presenter/page1/profile_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Page1Module extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (ctx) => const Page1Page(),
    );
  }
}
