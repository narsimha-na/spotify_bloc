part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class SignUpButtonPressedEvent extends AuthEvent {
  const SignUpButtonPressedEvent();
}

class LoginButtonPressedEvent extends AuthEvent {
  const LoginButtonPressedEvent();
}

class SignUpEmailChangedEvent extends AuthEvent {
  final String email;

  const SignUpEmailChangedEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class SignUpPasswordChangedEvent extends AuthEvent {
  final String password;

  const SignUpPasswordChangedEvent({required this.password});

  @override
  List<Object?> get props => [password];
}
