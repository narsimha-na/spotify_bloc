part of 'auth_bloc.dart';

enum AuthStatus {
  inital,
  success,
  failure,
  loading,
}

class AuthState extends Equatable {
  final String message;
  final AuthStatus status;
  final String email;
  final String password;

  const AuthState({
    this.message = '',
    this.status = AuthStatus.loading,
    this.email = '',
    this.password = '',
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? message,
    AuthStatus? status,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
      ];
}
