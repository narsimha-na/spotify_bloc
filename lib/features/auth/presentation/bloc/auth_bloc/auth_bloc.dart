import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify_bloc/features/auth/domain/repository/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc({
    required AuthService authService,
  })  : _authService = authService,
        super(const AuthState()) {
    on<SignUpButtonPressedEvent>(_handleCreateAccountEvent);
    on<SignUpEmailChangedEvent>(_handleSignUpEmailChangedEvent);
    on<SignUpPasswordChangedEvent>(_handleSignUpPasswordEvent);
    on<LoginButtonPressedEvent>(_handleLoginAccountEvent);
  }

  Future<void> _handleSignUpEmailChangedEvent(
    SignUpEmailChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleSignUpPasswordEvent(
    SignUpPasswordChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleCreateAccountEvent(
    SignUpButtonPressedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(status: AuthStatus.success));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: AuthStatus.failure));
    }
  }

  Future<void> _handleLoginAccountEvent(
    LoginButtonPressedEvent event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: AuthStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(message: e.toString(), status: AuthStatus.failure));
      emit(state.copyWith(message: e.toString(), status: AuthStatus.inital));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: AuthStatus.failure));
      emit(state.copyWith(message: e.toString(), status: AuthStatus.inital));
    }
  }
}
