part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.loadAuthSession() = _LoadAuthSession;
  const factory AuthEvent.login(LoginRequestModel model) = _Login;
  const factory AuthEvent.register(RegisterRequestModel model) = _Register;
  const factory AuthEvent.logout() = _Logout;
}
