// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import '../../../../core/auth/data/models/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/auth/data/models/requests/login_request_model.dart';
import '../../../../core/auth/data/models/requests/register_request_model.dart';
import '../../../../core/auth/domain/repositories/auth_repository.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(const _StateInitial()) {
    on<_LoadAuthSession>((event, emit) async {
      final value = await authRepository.getAuthData();
      emit(_StateLoggedIn(value));
    });

    on<_Login>((event, emit) async {
      emit(const _StateLoading());

      final result = await authRepository.login(event.model);
      result.fold(
        (message) => emit(_StateError(message)),
        (model) => emit(_StateLoggedIn(model)),
      );
    });

    on<_Register>((event, emit) async {
      emit(const _StateLoading());

      final result = await authRepository.register(event.model);
      result.fold(
        (message) => emit(_StateError(message)),
        (model) => emit(_StateLoggedIn(model)),
      );
    });

    on<_Logout>(
      (event, emit) async {
        emit(const _StateLoading());

        final result = await authRepository.logout();

        result.fold(
          (message) => emit(_StateError(message)),
          (success) => success
              ? emit(const _StateLoggedOut())
              : emit(const _StateInitial()),
        );
      },
    );
  }
}
