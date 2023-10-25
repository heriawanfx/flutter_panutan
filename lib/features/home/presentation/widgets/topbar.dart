import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.add_to_drive_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
