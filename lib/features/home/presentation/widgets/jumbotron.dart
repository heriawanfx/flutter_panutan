// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_panutan/core/auth/data/models/user_model.dart';

// ignore: must_be_immutable
class Jumbtron extends StatelessWidget {
  UserModel userModel;
  Jumbtron({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hai, ${userModel.name}'),
          const Text('Selamat Datang', style: TextStyle(fontSize: 22)),
          const Text(
              'di Portal Aplikasi Naskah Dinas UT\ndan Administrasi Perkantoran')
        ],
      ),
    );
  }
}
