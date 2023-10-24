import 'dart:convert';

import '../models/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferences preferences;

  AuthLocalDataSource({required this.preferences});

  Future<bool> saveAuthData(AuthResponseModel model) async {
    final authJson = jsonEncode(model.toJson());
    final result = await preferences.setString('KEY_AUTH', authJson);
    return result;
  }

  Future<AuthResponseModel?> getAuthData() async {
    final authJson = preferences.getString('KEY_AUTH');

    if (authJson != null) {
      //Model Json from Preference must be double decoded
      final formattedJson = jsonDecode(authJson) as String;
      final model = AuthResponseModel.fromJson(formattedJson);
      return model;
    } else {
      return null;
    }
  }

  Future<bool> removeAuthData() async {
    final result = await preferences.remove('KEY_AUTH');
    return result;
  }
}
