import 'package:diamond_blank_app/app/presenter/page2/page2_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Page2Module extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (ctx) => const Page2Page(),
    );
  }
}
