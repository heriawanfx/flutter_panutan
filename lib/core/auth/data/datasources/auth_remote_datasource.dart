import 'package:dio/dio.dart';
import 'package:flutter_panutan/core/remote/models/api_response.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/register_request_model.dart';
import '../models/auth_response_model.dart';

class AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasource({required this.dio});

  Future<ApiResponse<AuthResponseModel>> login(LoginRequestModel model) async {
    //Simulate Fake Login
    Map<String, dynamic> responseMap = {};
    Future.delayed(const Duration(seconds: 3), () {
      responseMap = {'success': true, 'data': model.toJson()};
    });
    return ApiResponse.fromMap(
      responseMap,
      (data) => AuthResponseModel.fromMap(data),
    );
  }

  Future<ApiResponse<AuthResponseModel>> register(
      RegisterRequestModel model) async {
    //Simulate Fake Register
    Map<String, dynamic> responseMap = {};
    Future.delayed(const Duration(seconds: 3), () {
      responseMap = {'success': true, 'data': model.toJson()};
    });
    return ApiResponse.fromMap(
      responseMap,
      (data) => AuthResponseModel.fromMap(data),
    );
  }

  Future<ApiResponse<bool>> logout() async {
    //Simulate Fake Logout
    Map<String, dynamic> responseMap = {};
    Future.delayed(const Duration(seconds: 3), () {
      responseMap = {'success': true, 'data': true};
    });
    return ApiResponse.fromMap(
      responseMap,
      (data) => true,
    );
  }
}
