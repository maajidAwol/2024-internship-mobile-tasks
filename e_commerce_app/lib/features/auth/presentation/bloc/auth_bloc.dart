import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failure/failure.dart';
import 'package:e_commerce_app/features/auth/domain/usecase/login.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:e_commerce_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/signup.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Login login;
  SignUp signUp;

  AuthBloc({required this.login, required this.signUp}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<SignUpEvent>(_onSignUp);
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    final result =
        await login.execute(email: event.email, password: event.password);
    print(result);
    result.fold((failure) => emit(AuthFailure()),
        (token) => emit(LoginSuccess(token: token)));
  }

  FutureOr<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoading());
    final result = await signUp.execute(
        name: event.name, email: event.email, password: event.password);
    print(result);

    result.fold((failure) => emit(AuthFailure()),
        (user) => emit(SignUpSuccess(user: user)));
  }
}
