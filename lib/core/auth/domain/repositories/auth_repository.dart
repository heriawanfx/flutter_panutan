import 'package:dartz/dartz.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/models/requests/login_request_model.dart';
import '../../data/models/requests/register_request_model.dart';
import '../../data/models/auth_response_model.dart';

class AuthRepository {
  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepository({
    required this.authLocalDataSource,
    required this.authRemoteDatasource,
  });

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel requestModel) async {
    final response = await authRemoteDatasource.login(requestModel);

    if (response.isError) {
      return Left(response.errorMessage);
    }
    return Right(response.getData);
  }

  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel requestModel) async {
    final response = await authRemoteDatasource.register(requestModel);

    if (response.isError) {
      return Left(response.errorMessage);
    }
    return Right(response.getData);
  }

  Future<AuthResponseModel?> getAuthData() async {
    return await authLocalDataSource.getAuthData();
  }

  Future<Either<String, bool>> logout() async {
    final response = await authRemoteDatasource.logout();

    if (response.isError) {
      return Left(response.errorMessage);
    }
    return Right(response.getData);
  }

  Future<Either<String, AuthResponseModel>> reLogin() async {
    final authData = await getAuthData();
    final user = authData?.user;
    final model = LoginRequestModel(
      email: user?.email ?? '',
      password: user?.password ?? '',
    );
    return await login(model);
  }
}
