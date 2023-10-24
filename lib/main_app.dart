import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_panutan/di/injector.dart';
import 'package:flutter_panutan/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_panutan/route/app_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: getInstance())
            ..add(const AuthEvent.loadAuthSession()),
        )
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return const MaterialApp(
          initialRoute: AppRouter.login,
          onGenerateRoute: AppRouter.generatedRoute,
        );
      }),
    );
  }
}
