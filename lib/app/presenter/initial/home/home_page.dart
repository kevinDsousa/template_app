import 'package:diamond_blank_app/app/presenter/initial/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Blank User'),
      accountEmail: Text('blank@email.com'),
      currentAccountPicture: CircleAvatar(child: FlutterLogo(size: 42.0)),
    );

    final drawerItens = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text('Page 1'),
          onTap: controller.goToPage1,
        ),
        ListTile(
          title: const Text('Page 2'),
          onTap: controller.goToPage2,
        ),
      ],
    );

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Home')),
          drawer: Drawer(child: drawerItens),
          body: const RouterOutlet(),
        );
      },
    );
  }
}
