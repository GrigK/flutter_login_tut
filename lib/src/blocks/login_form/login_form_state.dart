import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginFormState extends Equatable {
  const LoginFormState();

  @override
  List<Object> get props => [];
}

/// состояние инициализации формы
class LoginFormInitialState extends LoginFormState {}

/// состояние проверки учетных данных
class LoginFormLoadingState extends LoginFormState {}

/// попытка входа завершилась неудачей
class LoginFormFailureState extends LoginFormState {
  final String error;

  const LoginFormFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

