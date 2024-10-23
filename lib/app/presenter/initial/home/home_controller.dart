import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  goToPage1() {
    Modular.to.pushReplacementNamed('/home/page1/');
    Modular.to.pop();
  }

  goToPage2() {
    Modular.to.pushReplacementNamed('/home/page2/');
    Modular.to.pop();
  }
}
