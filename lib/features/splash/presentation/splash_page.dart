import 'package:flutter/material.dart';

import '../../../route/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRouter.dashboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome'),
    );
  }
}
