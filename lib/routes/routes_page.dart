import 'package:dashboard_site/views/cadastro/cadastro_page.dart';
import 'package:dashboard_site/views/home/home_page.dart';
import 'package:dashboard_site/views/login/login_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (BuildContext context) => const MyHomePage(),
        );
      case '/cadastro':
        return MaterialPageRoute(
          builder: (BuildContext context) => const CadastroPage(),
        );
      case '/auth':
        return MaterialPageRoute(
          builder: (BuildContext context) => const AuthVerify(),
        );
    }
    return null;
  }
}
