import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();
}

class LoginButtonPressedEvent extends LoginFormEvent {
  final String username;
  final String password;

  const LoginButtonPressedEvent(
      {@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      "LoginButtonPressed { username: $username, password: $password }";
}
