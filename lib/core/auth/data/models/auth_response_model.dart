// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user_model.dart';

class AuthResponseModel {
  String? jwtToken;
  UserModel? user;

  AuthResponseModel({this.jwtToken, this.user});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jwt-token': jwtToken,
      'user': user?.toMap(),
    };
  }

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      jwtToken: map['jwt-token'] != null ? map['jwt-token'] as String : null,
      user: map['user'] != null
          ? UserModel.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory AuthResponseModel.fromJson(String source) =>
      AuthResponseModel.fromMap(jsonDecode(source) as Map<String, dynamic>);

  AuthResponseModel copyWith({
    String? jwtToken,
    UserModel? user,
  }) {
    return AuthResponseModel(
      jwtToken: jwtToken ?? this.jwtToken,
      user: user ?? this.user,
    );
  }
}
