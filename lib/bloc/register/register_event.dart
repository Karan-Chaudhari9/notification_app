part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class EmailChanged extends RegisterEvent {
  EmailChanged({required this.email});

  final String email;

  @override
  String toString() => 'EmailChanged { email :$email }';

  @override
  List<Object?> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  PasswordChanged({required this.password});

  final String password;

  @override
  List<Object?> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends RegisterEvent {
  Submitted({required this.email, required this.password, required this.name});

  final String email;
  final String password;
  final String name;

  @override
  List<Object?> get props => [email, password, name];

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password, name: $name }';
  }
}