// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuickMenu extends StatelessWidget {
  const QuickMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NewWidgetItem(
          label: 'Fingerprint',
          iconData: Icons.fingerprint_outlined,
        ),
        NewWidgetItem(
          label: 'Ubah PIN',
          iconData: Icons.password_outlined,
        ),
        NewWidgetItem(
          label: 'Panduan',
          iconData: Icons.rocket_launch_outlined,
        ),
        NewWidgetItem(
          label: 'Semua',
          iconData: Icons.apps_outlined,
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class NewWidgetItem extends StatelessWidget {
  String label;
  IconData iconData;
  NewWidgetItem({
    Key? key,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, color: Colors.blue),
        Text(label),
      ],
    );
  }
}
