// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  String toJson() => jsonEncode(toMap());
}
