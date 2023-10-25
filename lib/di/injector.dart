import 'package:dio/dio.dart';
import 'package:flutter_panutan/features/home/data/datasources/summary_remote_data_source.dart';
import 'package:flutter_panutan/features/home/domain/repositories/summary_repository.dart';
import '../core/remote/auth_interceptor.dart';
import '../core/remote/dio_handler.dart';
import '../core/auth/data/datasources/auth_local_datasource.dart';
import '../core/auth/data/datasources/auth_remote_datasource.dart';
import '../core/auth/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/remote/pretty_log_interceptor.dart';

final getInstance = GetIt.instance;

class Injector {
  Future<void> initialize() async {
    await _initCore();
    _initSummary();
  }

  Future<void> _initCore() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getInstance.registerLazySingleton<SharedPreferences>(() {
      return sharedPreferences;
    });

    getInstance.registerLazySingleton<AuthLocalDataSource>(() {
      return AuthLocalDataSource(preferences: getInstance());
    });

    getInstance.registerLazySingleton<AuthInterceptor>(() {
      return AuthInterceptor(authLocalDataSource: getInstance());
    });

    getInstance.registerLazySingleton<PrettyLogInterceptor>(() {
      return PrettyLogInterceptor();
    });

    getInstance.registerLazySingleton<DioHandler>(() {
      return DioHandler(
        authInterceptor: getInstance(),
        prettyLogInterceptor: getInstance(),
      );
    });

    getInstance.registerLazySingleton<Dio>(() {
      return getInstance<DioHandler>().dio;
    });

    getInstance.registerLazySingleton<AuthRemoteDatasource>(() {
      return AuthRemoteDatasource(dio: getInstance());
    });

    getInstance.registerLazySingleton<AuthRepository>(() {
      return AuthRepository(
        authLocalDataSource: getInstance(),
        authRemoteDatasource: getInstance(),
      );
    });
  }

  Future<void> _initSummary() async {
    getInstance.registerLazySingleton<SummaryRemoteDatasource>(() {
      return SummaryRemoteDatasource(dio: getInstance());
    });

    getInstance.registerLazySingleton<SummaryRepository>(() {
      return SummaryRepository(
        summaryRemoteDatasource: getInstance(),
      );
    });
  }
}
