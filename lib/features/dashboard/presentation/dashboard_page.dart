import 'package:flutter/material.dart';
import 'package:flutter_panutan/features/dashboard/data/models/dashboard_menu.dart';
import 'package:flutter_panutan/features/home/presentation/home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _dashboardMenus[navIndex].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navIndex,
        destinations: _dashboardMenus.map((e) {
          final labelName = e.label;

          return NavigationDestination(
            label: labelName,
            icon: Icon(e.icon),
            selectedIcon: Icon(e.selectedIcon),
          );
        }).toList(),
        onDestinationSelected: (index) {
          _selectTab(context, index);
        },
      ),
    );
  }

  final List<DashboardMenu> _dashboardMenus = [
    DashboardMenu(
      label: 'Beranda',
      page: const HomePage(),
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
    ),
    DashboardMenu(
      label: 'Naskah',
      page: const Center(child: Text('Naskah')),
      icon: Icons.edit_document,
      selectedIcon: Icons.edit_document,
    ),
    DashboardMenu(
      label: 'Presensi',
      page: const Center(child: Text('Presensi')),
      icon: Icons.face_outlined,
      selectedIcon: Icons.face,
    ),
    DashboardMenu(
      label: 'Agenda',
      page: const Center(child: Text('Agenda')),
      icon: Icons.calendar_month_outlined,
      selectedIcon: Icons.calendar_month,
    ),
  ];

  void _selectTab(BuildContext context, int index) {
    setState(() {
      navIndex = index;
    });
  }
}
