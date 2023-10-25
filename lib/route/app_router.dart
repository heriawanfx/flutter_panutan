import 'package:flutter/material.dart';
import 'package:flutter_panutan/features/auth/presentation/auth_login_page.dart';
import 'package:flutter_panutan/features/dashboard/presentation/dashboard_page.dart';
import 'package:flutter_panutan/features/splash/presentation/splash_page.dart';

class AppRouter {
  const AppRouter._();

  static const login = '/login';
  static const splash = '/splash';
  static const dashboard = '/dashboard';
  static const user = '/user';

  static Route generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouter.login:
        return MaterialPageRoute(
          builder: (_) => const AuthLoginPage(),
        );
      case AppRouter.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case AppRouter.dashboard:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(child: Text('Not Found')),
        );
    }
  }
}
