import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static const home = '/';
  static const login = '/login';
  static const user = '/user';

  static Route generatedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      default:
        return MaterialPageRoute(
          builder: (context) => const Center(child: Text('Not Found')),
        );
    }
  }
}
