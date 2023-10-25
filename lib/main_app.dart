import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injector.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/presentation/bloc/summary_bloc.dart';
import 'route/app_router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: getInstance())
            ..add(const AuthEvent.loadAuthSession()),
        ),
        BlocProvider(
          create: (context) => SummaryBloc(summaryRepository: getInstance()),
        )
      ],
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return const MaterialApp(
          initialRoute: AppRouter.splash,
          onGenerateRoute: AppRouter.generatedRoute,
        );
      }),
    );
  }
}
