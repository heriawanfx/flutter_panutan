import 'package:flutter/material.dart';
import 'package:flutter_panutan/features/auth/presentation/auth_login_page.dart';

class AppRouter {
  const AppRouter._();

  static const home = '/';
  static const login = '/login';
  static const user = '/user';

  static Route generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouter.login:
        return MaterialPageRoute(
          builder: (_) => const AuthLoginPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('Not Found')),
        );
    }
  }
}
