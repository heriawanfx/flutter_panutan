import 'package:flutter/material.dart';
import 'package:flutter_panutan/core/auth/data/models/user_model.dart';
import 'package:flutter_panutan/features/home/presentation/widgets/jumbotron.dart';
import 'package:flutter_panutan/features/home/presentation/widgets/quick_menu.dart';
import 'package:flutter_panutan/features/home/presentation/widgets/summary_grid.dart';
import 'package:flutter_panutan/features/home/presentation/widgets/topbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Topbar(),
              Jumbtron(userModel: UserModel(name: 'Fantio Isdeo Margono')),
              const QuickMenu(),
              const Text('Aktivitas Saya'),
              const SummaryGrid()
            ],
          ),
        ),
      ),
    );
  }
}
