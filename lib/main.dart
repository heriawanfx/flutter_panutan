import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_panutan/di/injector.dart';
import 'package:flutter_panutan/main_app.dart';
import 'package:flutter_panutan/main_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector().initialize();
  Bloc.observer = MainObserver();
  runApp(const MainApp());
}
